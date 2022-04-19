# frozen_string_literal: true

RSpec.describe Granja do
  it "has a version number" do
    expect(Granja::VERSION).not_to be nil
  end

  # Tests de Animal
  describe "Representación de un Animal - Granja::Animal" do
    it "Crea un animal" do
      expect(Granja::Animal.new("Zorro", "macho", 555, 5200)).not_to eq(nil)
      expect(Granja::Animal.new("Zorro", "Macho", 555, 5200)).not_to eq(nil)
      expect(Granja::Animal.new("Zorro", "MACHO", 555, 5200)).not_to eq(nil)
    end

    it "Se comprueban los atributos de un animal" do
      expect(Granja::Animal.new("Zorro", "macho", 555, 5200).id).to eq("Zorro")
      expect(Granja::Animal.new("Zorro", "macho", 555, 5200).sexo).to eq(Granja::Sexo::MACHO)
      expect(Granja::Animal.new("Zorro", "macho", 555, 5200).edad).to eq(555)
      expect(Granja::Animal.new("Zorro", "macho", 555, 5200).peso).to eq(5200)
    end

    it "Se obtiene una cadena con la información del animal correctamente formateada" do
      expect(Granja::Animal.new("Zorro", "macho", 555, 5200).to_s).to \
      eq("INFORMACION DE Zorro:\nSEXO: MACHO\nEDAD: 555 DIAS\nPESO: 5200g")
    end

    it "Se comprueban las herencias de Animal" do
      expect(Granja::Animal.new("Zorro", "macho", 555, 5200)).to be_a_kind_of(Granja::Animal)
      expect(Granja::Animal.new("Zorro", "macho", 555, 5200)).to be_a_kind_of(Object)
      expect(Granja::Animal.new("Zorro", "macho", 555, 5200)).to be_a_kind_of(BasicObject)
      expect(Granja::Animal.new("Zorro", "macho", 555, 5200)).not_to be_a_kind_of(String)
      expect(Granja::Animal.new("Zorro", "macho", 555, 5200)).not_to be_a_kind_of(Numeric)
    end

    it "Los animales han de ser comparables según su peso" do
      x = Granja::Animal.new("Zorro", "macho", 555, 5200)
      y = Granja::Animal.new("Zorro", "macho", 555, 5500)
      expect(x < y).to eq(true)
      expect(x > y).to eq(false)
      expect(x == y).to eq(false)
      x = Granja::Animal.new("Zorro", "macho", 555, 5200)
      y = Granja::Animal.new("Zorro", "macho", 555, 5200)
      expect(x == y).to eq(true)
    end
  end

  # Test de Ave
  describe "Representación de un Ave - Granja::Ave" do
    it "Crea un ave" do
      expect(Granja::Ave.new("Gallina", "macho", 122, 60, "corto", "anisodactilas", "corredora")).not_to eq(nil)
    end

    it "Se comprueban los atributos de un ave" do
      expect(Granja::Ave.new("Gallina", "macho", 122, 60, "corto", "anisodactilas", "corredora").id).to eq("Gallina")
      expect(Granja::Ave.new("Gallina", "macho", 122, 60, "corto", "anisodactilas", "corredora").sexo).to eq(Granja::Sexo::MACHO)
      expect(Granja::Ave.new("Gallina", "macho", 122, 60, "corto", "anisodactilas", "corredora").edad).to eq(122)
      expect(Granja::Ave.new("Gallina", "macho", 122, 60, "corto", "anisodactilas", "corredora").peso).to eq(60)
      expect(Granja::Ave.new("Gallina", "macho", 122, 60, "corto", "anisodactilas", "corredora").pico).to eq(Granja::Pico::CORTO)
      expect(Granja::Ave.new("Gallina", "macho", 122, 60, "corto", "anisodactilas", "corredora").patas).to eq(Granja::Patas::ANISODACTILAS)
      expect(Granja::Ave.new("Gallina", "macho", 122, 60, "corto", "anisodactilas", "corredora").movilidad).to eq(Granja::Movilidad::CORREDORA)
    end

    it "Se obtiene una cadena con la información del ave correctamente formateada" do
      expect(Granja::Ave.new("Gallina", "macho", 122, 60, "corto", "anisodactilas", "corredora").to_s).to \
      eq("INFORMACION DE Gallina:\nSEXO: MACHO\nEDAD: 122 DIAS\nPESO: 60g\nPICO: CORTO\nPATAS: ANISODACTILAS\nMOVILIDAD: CORREDORA")
    end

    it "Se comprueban las herencias de Ave" do
      expect(Granja::Ave.new("Gallina", "macho", 122, 60, "corto", "anisodactilas", "corredora")).to be_a_kind_of(Granja::Ave)
      expect(Granja::Ave.new("Gallina", "macho", 122, 60, "corto", "anisodactilas", "corredora")).to be_a_kind_of(Granja::Animal)
      expect(Granja::Ave.new("Gallina", "macho", 122, 60, "corto", "anisodactilas", "corredora")).to be_a_kind_of(Object)
      expect(Granja::Ave.new("Gallina", "macho", 122, 60, "corto", "anisodactilas", "corredora")).to be_a_kind_of(BasicObject)
      expect(Granja::Ave.new("Gallina", "macho", 122, 60, "corto", "anisodactilas", "corredora")).not_to be_a_kind_of(String)
      expect(Granja::Ave.new("Gallina", "macho", 122, 60, "corto", "anisodactilas", "corredora")).not_to be_a_kind_of(Numeric)
    end

    it "Las aves han de ser comparables según su edad" do
      x = Granja::Ave.new("Gallina", "macho", 122, 300, "corto", "anisodactilas", "corredora")
      y = Granja::Ave.new("Gallina", "macho", 125, 250, "corto", "anisodactilas", "corredora")
      expect(x < y).to eq(true)
      expect(x > y).to eq(false)
      expect(x == y).to eq(false)
      x = Granja::Animal.new("Zorro", "macho", 555, 5200)
      y = Granja::Animal.new("Zorro", "macho", 555, 5200)
      expect(x == y).to eq(true)
    end
  end

  it "Se debe contar el numero de animales" do
    expect(Granja::Animal.count).to be_a_kind_of(Numeric)
  end

  # Test de Datos
  describe "Representación de los Datos de una Granja - Granja::Datos" do
    it "Crea datos de la granja" do
      expect(Granja::Datos.new(12, "Vaca Lechera", "ganadera", "Granja productora de leche")).not_to eq(nil)
    end

    it "Se comprueban los atributos de Datos" do
      expect(Granja::Datos.new(12, "Vaca Lechera", "ganadera", "Granja productora de leche").id).to eq(12)
      expect(Granja::Datos.new(12, "Vaca Lechera", "ganadera", "Granja productora de leche").name).to eq("Vaca Lechera")
      expect(Granja::Datos.new(12, "Vaca Lechera", "ganadera", "Granja productora de leche").type).to eq(Granja::TipoGranja::GANADERA)
      expect(Granja::Datos.new(12, "Vaca Lechera", "ganadera", "Granja productora de leche").desc).to eq("Granja productora de leche")
    end

    it "Se obtiene una cadena con la información de los datos correctamente formateada" do
      expect(Granja::Datos.new(12, "Vaca Lechera", "ganadera", "Granja productora de leche").to_s).to \
      eq("ID: 12\nNombre de la granja: Vaca Lechera\nTipo de granja: GANADERA\nDescripción: Granja productora de leche")
    end

    it "Se comprueban las herencias de Datos" do
      expect(Granja::Datos.new(12, "Vaca Lechera", "ganadera", "Granja productora de leche")).to be_a_kind_of(Granja::Datos)
      expect(Granja::Datos.new(12, "Vaca Lechera", "ganadera", "Granja productora de leche")).to be_a_kind_of(Object)
      expect(Granja::Datos.new(12, "Vaca Lechera", "ganadera", "Granja productora de leche")).to be_a_kind_of(BasicObject)
      expect(Granja::Datos.new(12, "Vaca Lechera", "ganadera", "Granja productora de leche")).not_to be_a_kind_of(String)
      expect(Granja::Datos.new(12, "Vaca Lechera", "ganadera", "Granja productora de leche")).not_to be_a_kind_of(Numeric)
    end
  end

  # Test de Avicola
  describe "Representación de los datos de una Granja de aves - Granja::Avicola" do
    before do
      all = Granja::Funcion.readCSV "data/granjas.csv", "data/aves.csv"
      @ave_h1 = all[0][0]
      @aves_hembras = [all[0][0], all[0][1], all[0][2]]
      @aves_machos =  [all[0][3], all[0][4], all[0][5]]
      @avicola = all[1][0]
      @todas_aves = @aves_hembras + @aves_machos
    end

    it "Crea datos de una granja avicola" do
      expect(@avicola).not_to eq(nil)
    end

    it "Se comprueban los atributos de Avicola" do
      expect(@avicola.id).to eq(2)
      expect(@avicola.name).to eq("Gallinas felices")
      expect(@avicola.type).to eq(Granja::TipoGranja::AVICOLA)
      expect(@avicola.desc).to eq("granja de gallinas")
      expect(@avicola.tipo_ave).to eq(Granja::TipoAve::POLLOS)
      expect(@avicola.destino).to eq(Granja::Destino::HUEVOS)
      expect(@avicola.precio).to eq(3.1)
      expect(@avicola.precio_venta).to eq(5.5)
      expect(@avicola.numero_aves).to eq(@todas_aves.size)
      expect(@avicola.aves).to eq(@todas_aves)
    end

    it "Se obtiene una cadena con la información de la granja avícola correctamente formateada" do
      expect(@avicola.to_s).to \
      eq("ID: 2\nNombre de la granja: Gallinas felices\nTipo de granja: AVICOLA\nDescripción: granja de gallinas\n" \
         "Tipo de aves: POLLOS\nDestino de los animales: HUEVOS\nPrecio por ave: 3.1€\nP.V.P. = 5.5€\nNúmero de aves: 6")
    end

    it "Las granjas avícolas han de ser Enumerables" do
      expect(@avicola.all? { |ave| ave.is_a?Granja::Ave }).to eq(true)
      expect(@avicola.any? { |ave| ave.sexo == Granja::Sexo::HEMBRA}).to eq(true)
      expect(@avicola.collect { |ave| ave.id }).to eq(["juana", "maria", "paca", "juan", "mario", "paco"])
      expect(@avicola.count).to eq(@avicola.numero_aves)
      expect(@avicola.filter { |ave| ave.sexo == Granja::Sexo::MACHO}).to be_a_kind_of(Array)
      expect((@avicola.filter { |ave| ave.sexo == Granja::Sexo::MACHO}).size).to eq(3)
      expect(@avicola.first).to eq(@ave_h1)
      expect(@avicola.include?@ave_h1).to eq(true)
      expect(@avicola.max).to eq(@ave_h1)
      expect(@avicola.take_while { |ave| ave.sexo == Granja::Sexo::HEMBRA}).to eq(@aves_hembras)

    end

    it "Herencia de la clase Avicola" do
      expect(@avicola).to be_a_kind_of(Granja::Avicola)
      expect(@avicola).to be_a_kind_of(Granja::Datos)
      expect(@avicola).to be_a_kind_of(Object)
      expect(@avicola).to be_a_kind_of(BasicObject)
      expect(@avicola).not_to be_a_kind_of(String)
      expect(@avicola).not_to be_a_kind_of(Numeric)
    end
  end

  # Test de Cooperativa
  describe "Interfaz de las cooperativas - Array(Granja::Avicola)" do
    before do
      @all = Granja::Funcion.readCSV "data/granjas.csv", "data/aves.csv"
      @cooperativa = @all[1].clone
      @todas_aves = @all[0].clone
      @avicola = @cooperativa[0]
    end

    it "Se calcula cuál es la granja con mayor índice de productividad" do
      expect(@cooperativa.max {|a,b| Granja::Funcion.indiceProd(a) <=> Granja::Funcion.indiceProd(b)}).to eq(@avicola)
    end

    it "Se aumenta el precio de venta de las aves proporcionalmente a la granja con mayor índice de productividad" do
      expect(@cooperativa.sum {|x| x.precio_venta}).to be <= (@cooperativa.collect {|x| x.aumentarPrecio(Granja::Funcion.indiceProd(@cooperativa.max {|a,b| Granja::Funcion.indiceProd(a) <=> Granja::Funcion.indiceProd(b)}) / Granja::Funcion.indiceProd(x))}.sum {|x| x.precio_venta})
    end
  end

  # Test de Funcion
  describe "Interfaz de las funcionalidades - Granja::Funcion" do
    before do
      all = Granja::Funcion.readCSV "data/granjas.csv", "data/aves.csv"
      @ave_h1 = all[0][0]
      @aves_hembras = [all[0][0], all[0][1], all[0][2]]
      @aves_machos =  [all[0][3], all[0][4], all[0][5]]
      @avicola = all[1][0]
      @todas_aves = @aves_hembras + @aves_machos
    end

    it "Componentes del módulo Funcion" do
      expect(Granja::Funcion::CAMPO).to eq("CAMPO ABIERTO")
      expect(Granja::Funcion::JAULAS).to eq("JAULAS")
      expect(Granja::Funcion.cares(@avicola, "antibiotico")).not_to eq(nil)
      expect(Granja::Funcion.reprod(@avicola, 24)).not_to eq(nil)
    end

    it "Se proporcionan cuidados especiales a las aves" do
      Granja::Funcion.cares(@avicola, "antibiotico")
      expect(@avicola.all? { |ave| ave.cuidados == "antibiotico" }).to eq(true)
    end

    it "Los animales se reproducen" do
      expect(Granja::Funcion.reprod(@avicola, 20)).to eq(true)
      expect(Granja::Funcion.reprod(@avicola)).to eq(true)
    end

    it "Se calcula el bienestar animal" do
      expect(Granja::Funcion.bienestarAnimal(@avicola)).to eq(53)
    end

    it "Se calcula el beneficio neto" do
      expect(Granja::Funcion.beneficioNeto(@avicola)).to eq(61.67)
    end

    it "Se calcula el índice de productividad" do
      expect(Granja::Funcion.indiceProd(@avicola)).to eq(2.5)
    end

    it "Se comprueban las herencias de Funcion" do
      expect(Granja::Funcion).to be_a_kind_of(Module)
      expect(Granja::Funcion).to be_a_kind_of(Object)
      expect(Granja::Funcion).to be_a_kind_of(BasicObject)
      expect(Granja::Funcion).not_to be_a_kind_of(String)
      expect(Granja::Funcion).not_to be_a_kind_of(Numeric)
    end
  end

  describe "Lenguaje de Dominio específo - DSL para los datos de la granja" do
    before do 
      granja_1 = Granja::DSLGranja.new(12345678) do
        datos "Pollos muertos",
        :descripcion => "PyME - Pequeña y mediana empresa",
        :tipo => 1
        ejemplar "12345678-00000001",
        :edad => 365,
        :peso => 700.2,
        :precio_compra => 4.25,
        :precio_venta => 4.75
        ejemplar "12345678-00000002",
        :edad => 465,
        :peso => 1200.2,
        :precio_compra => 1.25,
        :precio_venta => 2.75
      end
      @granja_1 = granja_1
      funcionalidad = Granja::DSLFuncionalidad.new(12345678) do
        beneficio granja_1
        bienestar granja_1, :condiciones => :campo
        productividad granja_1, :condiciones => :campo
      end
    end

    it "Tiene una clase para almacenar los datos de la granja" do
      expect(Granja::DSLGranja.class).to eq(Class)
    end

    it "Tiene un método para datos y otro para ejemplares" do
      expect(@granja_1.methods.select {|x| x if x == :datos}).to eq([:datos])
      expect(@granja_1.methods.select {|x| x if x == :ejemplares}).to eq([:ejemplares])
    end

    it "Se obtiene una cadena con la información de la granja correctamente formateada" do
      expect(@granja_1.to_s).to \
      eq("Granja: 12345678\n\nDatos: Pollos muertos\n PyME - Pequeña y mediana empresa\n POLLOS\n\nEjemplares:\n\n\n12345678-00000001\n   Edad: 365\n   Peso: 700.2\n   Precio compra: 4.25\n   Precio venta: 4.75\n\n12345678-00000002\n   Edad: 465\n   Peso: 1200.2\n   Precio compra: 1.25\n   Precio venta: 2.75\n\n")
    end
  end

  describe "Lenguaje de Dominio específo - DSL para las funcionalidades de la granja" do
    before do 
      granja_1 = Granja::DSLGranja.new(12345678) do
        datos "Pollos muertos",
        :descripcion => "PyME - Pequeña y mediana empresa",
        :tipo => 1
        ejemplar "12345678-00000001",
        :edad => 365,
        :peso => 700.2,
        :precio_compra => 4.25,
        :precio_venta => 4.75
        ejemplar "12345678-00000002",
        :edad => 465,
        :peso => 1200.2,
        :precio_compra => 1.25,
        :precio_venta => 2.75
      end
      funcionalidad = Granja::DSLFuncionalidad.new(12345678) do
        beneficio granja_1
        bienestar granja_1, :condiciones => :campo
        productividad granja_1, :condiciones => :campo
      end
      @funcionalidad = funcionalidad
    end

    it "Tiene una clase para almacenar las funcionalidades de la granja" do
      expect(Granja::DSLFuncionalidad.class).to eq(Class)
    end

    it "Tiene un método para beneficio, otro para bienestar y otro para productividad" do
      expect(@funcionalidad.methods.select {|x| x if x == :beneficio}).to eq([:beneficio])
      expect(@funcionalidad.methods.select {|x| x if x == :bienestar}).to eq([:bienestar])
      expect(@funcionalidad.methods.select {|x| x if x == :productividad}).to eq([:productividad])
    end

    it "Se obtiene una cadena con la información de las funcionalidades correctamente formateada" do
      expect(@funcionalidad.to_s).to \
      eq("Beneficio de la granja 12345678: 139.51\nBienestar de la granja 12345678: 87\nProductividad de la granja 12345678: 3\n")
    end
  end

end
