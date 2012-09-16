# load Rails/Railtie
begin
  require 'rails'
rescue LoadError
  #do nothing
end

require "filepickerio_rails/version"
require 'filepickerio_rails/configuration'
require 'filepickerio_rails/railtie' if defined?(Rails)