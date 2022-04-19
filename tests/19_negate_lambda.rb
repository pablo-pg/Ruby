# Tema 4
# 19. Escriba un m´etodo Ruby negate que reciba como argumento un lambdas y niege el predicado
# que recibe como par´ametro.


def negate(num)
  lambda = ->(arg1) {-arg1}
  lambda.call(num)
end

puts negate(5)