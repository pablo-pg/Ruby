require_relative "datos.rb"

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

  module Destino
    HUEVOS = 0
    SACRIFICIO = 1

    def self.to_s destino
      for sym in self.constants
        if self.const_get(sym) == destino
          return sym.to_s
        end
      end
    end
  end
  
  class Avicola < Granja::Datos
    attr_reader :tipo_ave, :destino, :condiciones, :numero_aves, :precio, :precio_venta, :aves
    include Enumerable

    def initialize id, name, desc, tipo_ave, destino, condiciones, precio, precio_venta, aves = []
      super(id, name, Granja::TipoGranja::AVICOLA, desc)
      @precio, @precio_venta = precio, precio_venta
      @aves = aves
      @condiciones = condiciones
      @numero_aves = aves.size
      # Tipo de ave
      if (tipo_ave == 0) or (tipo_ave == "gansos") or (tipo_ave == "GANSOS")
        @tipo_ave = Granja::TipoAve::GANSOS
      elsif (tipo_ave == 1) or (tipo_ave == "pollos") or (tipo_ave == "POLLOS")
        @tipo_ave = Granja::TipoAve::POLLOS
      elsif (tipo_ave == 2) or (tipo_ave == "patos") or (tipo_ave == "PATOS")
        @tipo_ave = Granja::TipoAve::PATOS
      elsif (tipo_ave == 3) or (tipo_ave == "pavos") or (tipo_ave == "PAVOS")
        @tipo_ave = Granja::TipoAve::PAVOS
      else
        raise "El tipo de ave #{tipo_ave} no es válido"
      end
      # Destino de la granja
      if (destino == 0) or  (destino == "HUEVOS") or (destino == "huevos")
        @destino = Granja::Destino::HUEVOS
      elsif (destino == 1) or  (destino == "SACRIFICIO") or (destino == "sacrificio")
        @destino = Granja::Destino::SACRIFICIO
      else
        raise "El destino de los animales indicado (#{destino} no es válido."
      end
    end

    def to_s
      super.to_s << "\nTipo de aves: #{Granja::TipoAve::to_s @tipo_ave}\nDestino de los animales: " \
             "#{Granja::Destino::to_s @destino}\nPrecio por ave: #{precio}€\nP.V.P. = #{precio_venta}€" \
             "\nNúmero de aves: #{@numero_aves}"
    end

    def each
      @aves.each {|ave| yield ave}
    end

    def nacer ave
      if ave.is_a?Granja::Ave
        @aves.push ave
        @numero_aves = @aves.size
      else
        raise "No puede nacer algo que no sea un ave"
      end
    end

    def aumentarPrecio precio
      Granja::Avicola.new(@id, @name, @desc, @tipo_ave, @destino, @condiciones, @precio, @precio_venta * precio, @aves)
    end
  end
end
