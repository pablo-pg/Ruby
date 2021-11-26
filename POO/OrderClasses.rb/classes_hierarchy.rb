#                            nil
#                             |
#                        BasicObject
#                             |
#                          Object
#                          | | | |
#   -----------------------  | | ------------------------------
#   |        ----------------  ----------------     |         |
#  Array     |                                |   String     ....
#         Numeric                           Module
#           | |                               |
#       ----- -----                         Class
#       |         |
#    Integer    Float
#
#


def show_parents(a_class)
  if a_class != nil
    puts "#{a_class} is son of #{a_class.superclass} \n"
    show_class a_class.class
    show_parents a_class.superclass
  end
end

def show_class(a_class)
  if a_class != nil
    puts "   Type: #{a_class} is son of #{a_class.superclass}"
    show_class a_class.superclass
  end
end

show_parents(1.class)
puts "\n\n\n"

show_parents(1.0.class)
puts "\n\n\n"

show_parents("".class)
puts "\n\n\n"

show_parents([].class)
puts "\n\n\n"
