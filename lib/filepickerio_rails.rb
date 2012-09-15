# load Rails/Railtie
begin
  require 'rails'
rescue LoadError
  #do nothing
end

$stderr.puts <<-EOC if !defined?(Rails)
warning: no framework detected.
would you check out if your Gemfile appropriately configured?
---- e.g. ----
when Rails:
    gem 'filepickerio_rails'
EOC

require "filepickerio_rails/version"
require 'filepickerio_rails/configuration'
require 'filepickerio_rails/railtie' if defined?(Rails)