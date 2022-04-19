# Tema 4
# Escriba un método Ruby flip que reciba como argumentos dos lambdas y cambie el orden de
# los par´ametros.



def flip(x, y, lambda)
  lambda.call(x,y)
end

l = ->arg1, arg2 {arg1, arg2 = arg2, arg1}
x, y = 1, 2
puts x,y
x, y = flip(x, y, l)
puts "\n" 
puts x,y