# frozen_string_literal: true

require_relative "lib/granja/version"

Gem::Specification.new do |spec|
  spec.name = "granja"
  spec.version = Granja::VERSION
  spec.authors = ["pablo-pg"]
  spec.email = ["alu0101318318@ull.edu.es"]

  spec.summary = "Gema para representar granjas."
  # spec.description = "TODO: Write a longer description or delete this line."
  spec.homepage = "https://github.com/ULL-ESIT-LPP-2122/granja-pablo-pg.git"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 2.6.0"

  spec.metadata["allowed_push_host"] = "https://github.com/ULL-ESIT-LPP-2122/granja-pablo-pg.git"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/ULL-ESIT-LPP-2122/granja-pablo-pg.git"
  spec.metadata["changelog_uri"] = "https://github.com/ULL-ESIT-LPP-2122/granja-pablo-pg.git"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject do |f|
      (f == __FILE__) || f.match(%r{\A(?:(?:test|spec|features)/|\.(?:git|travis|circleci)|appveyor)})
    end
  end
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  # Uncomment to register a new dependency of your gem
  # spec.add_dependency "example-gem", "~> 1.0"
  spec.add_development_dependency "bundler"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "guard"
  spec.add_development_dependency "guard-rspec"
  spec.add_development_dependency "guard-bundler"

  # For more information and examples about making a new gem, checkout our
  # guide at: https://bundler.io/guides/creating_gem.html
end
