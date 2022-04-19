
module Granja

  module TipoGranja
    AVICOLA = 0
    GANADERA = 1

    def self.to_s sexo
      for sym in self.constants
        if self.const_get(sym) == sexo
          return sym.to_s
        end
      end
    end

  end

  class Datos
    attr_reader :id, :name, :type, :desc
    def initialize id, name, type, desc
      @id, @name, @desc = id, name, desc
      if (type == 0) or (type == "avicola") or (type == "AVICOLA")
        @type = Granja::TipoGranja::AVICOLA
      elsif (type == 1) or (type == "ganadera") or (type == "GANADERA")
        @type = Granja::TipoGranja::GANADERA
      else
        raise "El tipo de granja #{type} no es válido"
      end
    end

    def to_s
      "ID: #{@id}\nNombre de la granja: #{@name}\nTipo de granja: #{Granja::TipoGranja::to_s @type}\nDescripción: #{@desc}"
    end
  end
end