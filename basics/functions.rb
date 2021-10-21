# Testing how to create functions
# Pablo Pérez González

def sum x, y
  return x + y
end


def minor x, y
  return x < y
end


def concatenate str1, str2
  str3 = str1 + str2
  return str3
end


def main
  x = 2
  y = 3
  puts "------Starting main------"
  if minor(x, y)
    x = sum(x, y)
  elsif x > y
    y = sum(x, y)
  end
  puts "X = #{x} \nY = #{y}"
end



puts sum 5,5
puts minor(2, 7)
puts concatenate "First", "Second"

main  # También puede ser main()