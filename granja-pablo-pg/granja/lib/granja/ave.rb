require_relative "animal.rb"

module Granja

  module Pico
    CORTO = 0
    GRUESO_Y_ROBUSTO = 1
    ANCHO_Y_APLANADO = 2

    def self.to_s sexo
      for sym in self.constants
        if self.const_get(sym) == sexo
          return sym.to_s
        end
      end
    end
  end

  module Patas
    ANISODACTILAS = 0
    PALMEADAS = 1

    def self.to_s sexo
      for sym in self.constants
        if self.const_get(sym) == sexo
          return sym.to_s
        end
      end
    end
  end

  module Movilidad
    CORREDORA = 0
    VOLADORA = 1
    NADADORA = 2

    def self.to_s sexo
      for sym in self.constants
        if self.const_get(sym) == sexo
          return sym.to_s
        end
      end
    end
  end


  class Ave < Granja::Animal
    attr_reader :pico, :patas, :movilidad, :cuidados

    def initialize id, sexo, edad, peso, pico, patas, movilidad
      super(id, sexo, edad, peso)
      @cuidados = 0
      # Pico
      if (pico == 0) or (pico == "CORTO") or (pico == "corto") or (pico == "0")
        @pico = Granja::Pico::CORTO
      elsif (pico == 1) or (pico == "GRUESO") or (pico == "grueso") or (pico == "1") or
            (pico == "grueso y robusto") or (pico == "GRUESO Y ROBUSTO")
        @pico = Granja::Pico::GRUESO_Y_ROBUSTO
      elsif (pico == 2) or (pico == "ANCHO") or (pico == "ancho") or (pico == "2") or
            (pico == "ancho y aplanado") or (pico == "ANCHO Y APLANADO")
        @pico = Granja::Pico::ANCHO_Y_APLANADO
      else
        raise "El tipo de pico #{pico} no es válido."
      end
      # Patas
      if (patas == 0) or (patas == "anisodactilas") or (patas == "0") or (patas == "ANISODACTILAS")
        @patas = Granja::Patas::ANISODACTILAS
      elsif (patas == 1) or (patas == "palmeadas") or (patas == "1") or (patas == "PALMEADAS")
        @patas = Granja::Patas::PALMEADAS
      else
        raise "El tipo de patas #{patas} no es válido."
      end
      # Movilidad
      if (movilidad == 0) or (movilidad == "0") or (movilidad == "corredora") or
         (movilidad == "CORREDORA")
        @movilidad = Granja::Movilidad::CORREDORA
      elsif (movilidad == 1) or (movilidad == "1") or (movilidad == "voladora") or
            (movilidad == "VOLADORA")
        @movilidad = Granja::Movilidad::VOLADORA
      elsif (movilidad == 2) or (movilidad == "2") or (movilidad == "nadadora") or
            (movilidad == "NADADORA")
        @movilidad = Granja::Movilidad::NADADORA
      else 
        raise "El tipo de movilidad #{movilidad} no es válida."
      end

      def to_s
        super.to_s << "\nPICO: #{Granja::Pico::to_s @pico}\n" \
              "PATAS: #{Granja::Patas::to_s @patas}\n" \
              "MOVILIDAD: #{Granja::Movilidad::to_s @movilidad}"
      end

      def <=> other
        return nil unless other.is_a?Ave or other.is_a?Numeric
        if other.is_a?Granja::Ave
          return @edad <=> other.edad
        else
          return @edad <=> other
        end
      end
      
      def set_cuidado cuidado
        @cuidados = cuidado
      end

      def +(other)
        return nil unless other.is_a?Numeric
        @cuidados += other
      end
    end
  end
end
