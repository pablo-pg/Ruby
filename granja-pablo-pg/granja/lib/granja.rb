# frozen_string_literal: true

require_relative "granja/version"
require 'granja/animal.rb'
require 'granja/datos.rb'
require 'granja/funcionalidades.rb'
require 'granja/ave.rb'
require 'granja/avicola.rb'
require 'granja/dsl_granja.rb'
require 'granja/dsl_funcionalidades.rb'

module Granja
  class Error < StandardError; end
end
