# Understanding the hierarchy of Ruby data types classes
#
# Author: Pablo Pérez González
# email: pablo.perez.gonzalez.23@ull.edu.es
#
#                            nil                         NilClass
#                             |                             |
#                        BasicObject                       nil
#                             |
#                          Object
#                          | | | |
#   -----------------------  | | ---------------------------------------------
#   |              ----------- -----------          |     |    |     |       |         
#  Array           |                     |        String  |  Symbol  |   TrueClass
#               Numeric                Module             |          |
#                 | |          ----------|------------   Hash    FalseClass
#             ----- -----      |         |           | 
#             |         |    Class   Enumerable  Comparable
#          Integer    Float           (mixin)      (mixin)
#
#


def show_super(a_class)
  if a_class != nil
    if a_class.superclass != nil    # Because if superclass == nil, puts a whitespace
      puts "#{a_class} is son of #{a_class.superclass} \n"
      show_class a_class.class
      show_super a_class.superclass
    else
      puts "#{a_class} is son of nil \n"
      show_class a_class.class
      show_super a_class.superclass
    end
  end
end

def show_class(a_class)
  if a_class != nil
    if a_class.superclass != nil    # Because if superclass == nil, puts a whitespace
      puts "   Class: #{a_class} is son of: #{a_class.superclass} with class #{a_class.superclass.class}"
      show_class a_class.superclass
    else
      puts "   Class: #{a_class} is son of: nil with class #{a_class.superclass.class}"
      show_class a_class.superclass
    end
  end
end

show_super(1.class)
puts "\n\n\n"

show_super(1.0.class)
puts "\n\n\n"

show_super(:x.class)
puts "\n\n\n"

show_super(false.class)  # false.class != true.class
puts "\n\n\n"

show_super("".class)
puts "\n\n\n"

show_super([].class)
puts "\n\n\n"

show_super({}.class)
puts "\n\n\n"

show_super(Enumerable.class)