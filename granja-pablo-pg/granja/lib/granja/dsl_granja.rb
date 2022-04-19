
module Granja

  module TipoAve
    GANSOS = 0
    POLLOS = 1
    PATOS = 2
    PAVOS = 3

    def self.to_s tipo
      for sym in self.constants
        if self.const_get(sym) == tipo
          return sym.to_s
        end
      end
    end
  end

  class DSLGranja
    attr_reader :ejemplares
    def initialize(id, &block)
      @id = id
      @datos = {}
      @ejemplares = []

      instance_eval &block
    end

    def to_s
      s ="Granja: #{@id}\n\n"
      s << "Datos: #{@datos[:id]}\n #{(@datos[:descripcion]) if @datos[:descripcion]}\n #{(Granja::TipoAve::to_s @datos[:tipo]) if @datos[:tipo]}\n"
      s << "\nEjemplares:\n"
      @ejemplares.each {|x| s << "\n\n#{x[:id] if x[:id]}\n   Edad: #{x[:edad] if x[:edad]}\n   Peso: #{x[:peso] if x[:peso]}\n   Precio compra: #{x[:precio_compra] if x[:precio_compra]}\n   Precio venta: #{x[:precio_venta] if x[:precio_venta]}"}
      s << "\n\n"
      s
    end

    def datos(name, options = {})
      @datos[:id] = name
      @datos[:descripcion] = options[:descripcion] if options[:descripcion]
      @datos[:tipo] = options[:tipo] if options[:tipo]
    end

    def ejemplar(name, options = {})
      ejemplar = {}
      ejemplar[:id] = name
      ejemplar[:edad] = options[:edad] if options[:edad]
      ejemplar[:peso] = options[:peso] if options[:peso]
      ejemplar[:precio_compra] = options[:precio_compra] if options[:precio_compra]
      ejemplar[:precio_venta] = options[:precio_venta] if options[:precio_venta]
      @ejemplares.push(ejemplar)
    end
  end

end

# granja_1 = Granja::DSLGranja.new(12345678) do
#   datos "Pollos muertos",
#   :descripcion => "PyME - Pequeña y mediana empresa",
#   :tipo => 1
#   ejemplar "12345678-00000001",
#   :edad => 365,
#   :peso => 700.2,
#   :precio_compra => 4.25,
#   :precio_venta => 4.75
#   ejemplar "12345678-00000002",
#   :edad => 465,
#   :peso => 1200.2,
#   :precio_compra => 1.25,
#   :precio_venta => 2.75
#   end

# puts granja_1