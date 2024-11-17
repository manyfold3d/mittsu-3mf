require_relative "lib/mittsu/3mf/version"

Gem::Specification.new do |spec|
  spec.name = "mittsu-3mf"
  spec.version = Mittsu::ThreeMF::VERSION
  spec.authors = ["James Smith"]
  spec.email = ["james@floppy.org.uk"]
  spec.homepage = "https://github.com/manyfold3d/mittsu-3mf"
  spec.summary = "3MF file support for Mittsu"
  spec.description = "3MF file support for Mittsu"
  spec.license = "MIT"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/manyfold3d/mittsu-3mf"
  spec.metadata["changelog_uri"] = "https://github.com/manyfold3d/mittsu-3mf/releases"

  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    Dir["lib/**/*", "LICENSE
    ", "Rakefile", "README.md"]
  end

  spec.required_ruby_version = "~> 3.1"

  spec.add_dependency "mittsu", "~> 0.4"
  spec.add_dependency "builder", "~> 3.3"
  spec.add_dependency "rubyzip", "~> 2.3"

  spec.add_development_dependency "rake", "~> 13.2"
  spec.add_development_dependency "rspec", "~> 3.13"
  spec.add_development_dependency "standard", "~> 1.41"
  spec.add_development_dependency "rexml", "~> 3.3"
end
