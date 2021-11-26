class Point
  # Mixins
  include Comparable  # <, <=, ==, !=, ...
  include Enumerable  # max, min, ...
  
  attr_reader :x, :y
  def initialize x = 0, y = 0
    @x, @y = x, y
  end
  def to_s
    "(#{@x}, #{@y})"
  end

  def + other   # with duck-typing
    if (other.respond_to?:x and other.respond_to?:y)
      return Point.new(@x + other.x, @y + other.y)
    else
      raise "Other hasn't atribs @x and @y"
    end
  end
  
  def - other
    if (other.is_a?Point)  # allows inheritance
      return Point.new(@x - other.x, @y - other.y)
    else
      raise "Cant do a substraction with something that is no a Point"
    end
  end

  def * other     # Escalar product
    if other.is_a?Numeric  # allows polymorphism
      return Point.new(@x * other, @y * other)
    end
  end

  # For Comparable
  def <=> other
    return nil unless other.instance_of?Point  # disallows polymorphism
    # Compare with the size of the line between the point and (0,0)
    return @x**2 + @y**2 <=> other.x**2 + other.y**2
  end

  # For Enumerable
  def each
    yield @x  # do the parameter passed code with x
    yield @y  # do the parameter passed code with y
  end

  def == other  # included in <=> but i dont want to compare by size, so use inheritance
    if other.instance_of?Point
      return (@x == other.x and @y == other.y)
    else
      false
    end
  end
  # Const
  ORIGIN = Point.new(0, 0)
end


a = Point.new(1,1)
b = a + Point::ORIGIN
puts a == b  # True
b = Point.new(1, 2)
puts a < b  # True, From Comparable
c = a + b   # (1,1) + (1,2)
puts c.to_s
puts c.to_a  # From Enumerable
puts c * 2   # Implicit call to to_s
