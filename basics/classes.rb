# Testing about Ruby Classes
# Pablo Pérez González

class Mynum
  attr_accessor :value  # Getter-setter
  # attr_reader :value  # Getter
  # attr_writer :value  # Setter
  def initialize(num)
    @value = num
  end
  def print
    puts "El valor es #{@value}"
  end
  def sum x
    return x + @value
  end
  def multiply x
    return x * @value
  end
end


obj = Mynum.new(5)
obj.print
obj2 = Mynum.new(7)
obj.value = obj.sum(obj2.value)
obj.print

