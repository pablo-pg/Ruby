require_relative "./dsl_granja.rb"

module Granja

class DSLFuncionalidad
  def initialize(id, &block)
    @id = id
    @beneficio = 0
    @bienestar = 0
    @productividad = 0

    instance_eval &block
  end

  def to_s
    "Beneficio de la granja #{@id}: #{@beneficio}\nBienestar de la granja #{@id}: #{@bienestar}\nProductividad de la granja #{@id}: #{@productividad}\n"
  end

  def beneficio granja
    # puts "a #{granja.to_s}"
    @beneficio = (granja.ejemplares.sum {|ave| (ave[:peso].to_f / 1000) * ave[:precio_venta]} / (granja.ejemplares.max{|a,b| (a[:precio_venta] * a[:peso]) <=> b[:precio_venta] * b[:peso]})[:precio_venta] * 100).round(2)
  end

  def bienestar granja, condiciones
    if condiciones[:condiciones] == :campo
      @bienestar =((granja.ejemplares.sum {|ave| ave[:peso].to_f / ave[:edad]} / granja.ejemplares.size) * 100 / (granja.ejemplares.max {|a,b| (a[:peso].to_f / a[:edad]) <=> (b[:peso].to_f / b[:edad])}[:peso] / granja.ejemplares.max {|a,b| (a[:peso].to_f / a[:edad]) <=> (b[:peso].to_f / b[:edad])}[:edad])).round
    else
      @bienestar =(((granja.ejemplares.sum {|ave| ave[:peso].to_f / ave[:edad]} / granja.ejemplares.size) * 100 / (granja.ejemplares.max {|a,b| (a[:peso].to_f / a[:edad]) <=> (b[:peso].to_f / b[:edad])}[:peso] / granja.ejemplares.max {|a,b| (a[:peso].to_f / a[:edad]) <=> (b[:peso].to_f / b[:edad])}[:edad]))/2).round
    end
  end
  
  def productividad granja, condiciones
    @productividad = 1 if (bienestar(granja, condiciones) <= 20) and (beneficio(granja) < 10)
    @productividad = 2 if (bienestar(granja, condiciones).between?(21,79)) and (beneficio(granja).between?(10,50))
    @productividad = 3 if (80 <= bienestar(granja, condiciones)) and (50 < beneficio(granja))
    @productividad = 2 if (bienestar(granja, condiciones) <= 20) and (50 < beneficio(granja))
    @productividad = 1.5 if (bienestar(granja, condiciones) <= 20) and (beneficio(granja).between?(10,50))
    @productividad = 1.5 if (bienestar(granja, condiciones).between?(21,79)) and (beneficio(granja) < 10)
    @productividad = 2.5 if (bienestar(granja, condiciones).between?(21,79)) and (50 < beneficio(granja))
    @productividad = 2.5 if (80 <= bienestar(granja, condiciones)) and (beneficio(granja).between?(10,50))
  end
end

end

# granja_1 = Granja::DSLGranja.new(12345678) do
#   datos "Pollos muertos",
#     :descripcion => "PyME - Peque~na y mediana empresa",
#     :tipo => :pollos
#   ejemplar "12345678-00000001",
#     :edad => 365,
#     :peso => 700.2,
#     :precio_compra => 4.25,
#     :precio_venta => 4.75
#   ejemplar "12345678-00000002",
#     :edad => 465,
#     :peso => 1200.2,
#     :precio_compra => 1.25,
#     :precio_venta => 2.75
# end


# funcionalidad = Granja::DSLFuncionalidad.new(12345678) do
#   beneficio granja_1
#   bienestar granja_1, :condiciones => :campo
#   productividad granja_1, :condiciones => :campo
# end

# puts funcionalidad