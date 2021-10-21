# Testing conditions and loops
# Pablo Pérez González

num = 5
num2 = 3

# Conditionals
if num == 5
  puts "num is 5"
end


if num2 == 5
  puts "num2 is 5"
elsif num2 > 5
  puts "num2 > 5"
else
  puts "num2 < 5"
end
puts "\n"


# Loops
i = 0
while i < 10
  puts "i = #{i}"
  i += 1
end

i = 0
while i < 10
  if i == 7
    puts "i = #{i}"
  else
    puts "i != 7 - Avanza"
  end
  i += 1
end

