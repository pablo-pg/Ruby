
module Granja

  module Sexo
    MACHO = 0
    HEMBRA = 1

    def self.to_s sexo
      for sym in self.constants
        if self.const_get(sym) == sexo
          return sym.to_s
        end
      end
    end

  end


  class Animal
    attr_reader :id, :edad, :sexo, :peso
    @@numero_animales = 0
    include Comparable

    def initialize id, sexo, edad, peso
      @id, @edad, @peso = id, edad, peso
      @@numero_animales += 1
      if (sexo == "macho") or (sexo == "Macho") || (sexo == "MACHO") or (sexo == Granja::Sexo::MACHO)
        @sexo = Granja::Sexo::MACHO
      elsif (sexo == "hembra") or (sexo == "Hembra") || (sexo == "HEMBRA") or (sexo == Granja::Sexo::HEMBRA)
        @sexo = Granja::Sexo::HEMBRA
      else
        raise "El género #{sexo} no es válido."
      end
    end
  
    def to_s
      "INFORMACION DE #{@id}:\nSEXO: #{Granja::Sexo::to_s @sexo}\nEDAD: #{@edad} DIAS\nPESO: #{@peso}g"
    end

    def self.count
      @@numero_animales
    end

    def <=> other
      return nil unless other.is_a?Animal
      return @peso <=> other.peso
    end
  end
    
end

