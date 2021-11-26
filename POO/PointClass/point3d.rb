
require './point'

class Point3D < Point  # Inheritance
  attr_reader :z
  def initialize x, y, z
    super(x, y)  # Calls the parent class constructor
    @z = z
  end

  def to_s
    s = ""
    s << super.to_s[0..-2]  # The [0..-2]  removes the original ")" at @y
    s << ", #{@z})"
    return s
  end

  def + other
    if (other.respond_to?:x and other.respond_to?:y and other.respond_to?:z)  # Duck-typing
      return Point3D.new(@x + other.x, @y + other.y, @z + other.z)
    else
      raise "Cant add a Point3D with any type with no @x or @y or @z"
    end
  end

  ORIGIN = Point3D.new(0, 0, 0)

end

# Normal Point tests
# a = Point.new(1,1)
# b = a + Point::ORIGIN
# puts a == b  # True
# b = Point.new(1, 2)
# puts a < b  # True, From Comparable
# c = a + b   # (1,1) + (1,2)
# puts c.to_s
# puts c.to_a  # From Enumerable
# puts c * 2   # Implicit call to to_s
 

# Point3D tests
a = Point3D.new(1, 2, 3)
puts a.to_s
b = Point.new(2,1)
c = a + b  # <- My raise: Runtime Error: B hasn't @z
puts c
