# Testing some Ruby variables
# Pablo Pérez González

num = 5
num2 = 7
puts num + num2
puts "\n"

puts "What's your name? "
str2 = gets
puts "Hello #{str2} \n" 


list = [1, 3, "List", 3.14]
puts list[1]
list[1] = "My"
puts list
puts "\n"


hash = {
  :oboe   => "woodwind",
  :drum   => "percussion",
  :cello  => "woodstring",
  :int_21 => "Twenty one",
  "21"    => "Twenty one"
}
puts hash[:int_21]
puts hash["21"]
puts hash[:oboe]