# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "filepickerio_rails/version"

Gem::Specification.new do |s|
  s.name        = "filepickerio_rails"
  s.version     = FilepickerioRails::VERSION
  s.authors     = ["Adam Burmister"]
  s.email       = ["adam.burmister@gmail.com"]
  s.homepage    = "http://adamburmister.github.com/filepickerio_rails/"
  s.summary     = %q{Rails view helpers for Filepicker.io widgets}
  s.description = %q{Rails view helpers for Filepicker.io widgets}

  s.rubyforge_project = "filepickerio_rails"

  s.files         = `git ls-files`.split("\n")
  s.files.reject! { |fn| fn.include? "example" } # don't include our example rails project which is just for testing

  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  # specify any dependencies here; for example:
  s.add_development_dependency "rspec"
  s.add_development_dependency "rspec-rails"
  s.add_development_dependency "rails"
  s.add_dependency "railties", "~> 3.1"
end
