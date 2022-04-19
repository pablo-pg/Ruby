# Tema 4
# ¿Qué se obtiene como salida? Describa el comportamiento del programa.

class MyArray < Array
  def initialize (a_array)
    super (a_array)
  end
  def times_repeat (a_num)
    a_num.times do |num|
      self.each do |i|
        yield "[#{num}] :: ’#{i}’"
      end
    end
  end
end

a_array = MyArray.new([1,2,3])
a_array.times_repeat(3) do |x|
  puts x
end 