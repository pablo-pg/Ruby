require 'csv'
require_relative "./ave.rb"
require_relative "./avicola.rb"

module Granja
  module Funcion
    CAMPO = "CAMPO ABIERTO"
    JAULAS = "JAULAS"
    
    def self.cares granja, cuidado
      return nil unless granja.is_a?Granja::Avicola
      granja.each { |ave| ave.set_cuidado (cuidado) }
    end

    # def self.reprod granja, meses = 24
    #   tam_orig = granja.numero_aves
    #   dias = meses * 30
    #   hembras = granja.filter { |ave| ave.edad > dias and ave.sexo == Granja::Sexo::HEMBRA }
    #   machos = granja.filter { |ave| ave.edad > dias and ave.sexo == Granja::Sexo::MACHO }
    #   return false unless (machos.size > 0) and (hembras.size > 0)
    #   for i in 0...hembras.size do
    #     n = "cría de #{(machos[rand(machos.size)]).id} y #{hembras[i].id}"
    #     sexo = rand(Granja::Sexo::MACHO..Granja::Sexo::HEMBRA)
    #     granja.nacer Granja::Ave.new(n, sexo, 0, 5, machos[0].pico,machos[0].patas, machos[0].movilidad)
    #   end
    #   tam_orig < granja.numero_aves
    # end

    def self.reprod granja, meses = 24
      tam_orig = granja.numero_aves
      granja.filter { |ave| ave.edad >= (meses * 30) and ave.sexo == Granja::Sexo::HEMBRA }.each do |ave_h|
        raise "No hay machos" unless granja.filter{|ave| ave.edad > (meses * 30) and ave.sexo == Granja::Sexo::MACHO}
        granja.nacer Granja::Ave.new("cría de #{granja.filter{|ave| ave.edad > (meses * 30) and ave.sexo == Granja::Sexo::MACHO}[rand(granja.filter{|ave| ave.edad > (meses * 30) and ave.sexo == Granja::Sexo::MACHO}.size)].id} y #{ave_h.id}", rand(Granja::Sexo::MACHO..Granja::Sexo::HEMBRA), 0, 5, ave_h.pico, ave_h.patas, ave_h.movilidad)
      end
      tam_orig < granja.numero_aves
    end

    def self.reprod_array array, meses = 24
      array.filter { |x| x > (meses * 30) }
    end

    def self.cares_array array, cantidad
      copy = array.clone
      copy.collect { |x| x + cantidad }
    end

    def self.bienestarAnimal granja
      if (granja.condiciones == Granja::Funcion::CAMPO) or (granja.condiciones == "CAMPO ABIERTO")
        ((granja.sum {|ave| ave.peso.to_f / ave.edad} / granja.aves.size) * 100 / (granja.max {|a,b| (a.peso.to_f / a.edad) <=> (b.peso.to_f / b.edad)}.peso / granja.max {|a,b| (a.peso.to_f / a.edad) <=> (b.peso.to_f / b.edad)}.edad)).round
      else
        (((granja.sum {|ave| ave.peso.to_f / ave.edad} / granja.aves.size) * 100 / (granja.max {|a,b| (a.peso.to_f / a.edad) <=> (b.peso.to_f / b.edad)}.peso / granja.max {|a,b| (a.peso.to_f / a.edad) <=> (b.peso.to_f / b.edad)}.edad)) / 2).round
      end
    end

    def self.beneficioNeto granja
      # Suponemos que el maximo beneficio es si todas las aves pesan 6Kg o llevan vivas 6000 dias
      if (granja.destino == 1) or (granja.destino == "SACRIFICIO")
        (granja.sum {|ave| (ave.peso.to_f / 1000) * granja.precio_venta} / (granja.precio_venta * 6000) * 100).round(2)
      else
        (granja.sum {|ave| (ave.edad.to_f) * granja.precio_venta}  / (granja.precio_venta * 6000) * 100).round(2)
      end
    end

    def self.indiceProd granja
      return 1 if (Granja::Funcion.bienestarAnimal(granja) <= 20) and (Granja::Funcion.beneficioNeto(granja) < 10)
      return 2 if (Granja::Funcion.bienestarAnimal(granja).between?(21,79)) and (Granja::Funcion.beneficioNeto(granja).between?(10,50))
      return 3 if (80 <= Granja::Funcion.bienestarAnimal(granja)) and (50 < Granja::Funcion.beneficioNeto(granja))
      return 2 if (Granja::Funcion.bienestarAnimal(granja) <= 20) and (50 < Granja::Funcion.beneficioNeto(granja))
      return 1.5 if (Granja::Funcion.bienestarAnimal(granja) <= 20) and (Granja::Funcion.beneficioNeto(granja).between?(10,50))
      return 1.5 if (Granja::Funcion.bienestarAnimal(granja).between?(21,79)) and (Granja::Funcion.beneficioNeto(granja) < 10)
      return 2.5 if (Granja::Funcion.bienestarAnimal(granja).between?(21,79)) and (50 < Granja::Funcion.beneficioNeto(granja))
      return 2.5 if (80 <= Granja::Funcion.bienestarAnimal(granja)) and (Granja::Funcion.beneficioNeto(granja).between?(10,50))
    end

    def self.readCSV file_granjas, file_aves
      granjas_data = CSV.parse(File.read(file_granjas), headers: true)
      aves_data = CSV.parse(File.read(file_aves), headers: true)
      aves = []
      granjas = []
      for ave in aves_data.by_row do
        aves.push Granja::Ave.new(ave[0], ave[1].to_i, ave[2].to_i, ave[3].to_i, ave[4].to_i, ave[5].to_i, ave[6].to_i)
      end
      for granja in granjas_data.by_row do
        granjas.push Granja::Avicola.new(granja[0].to_i, granja[1], granja[2], granja[3].to_i, granja[4].to_i, granja[5], granja[6].to_f, granja[7].to_f, aves)
      end
      return [aves, granjas]
    end

  end
end

# a = Granja::Funcion::readCSV
# puts a
