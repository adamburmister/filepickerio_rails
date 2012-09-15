require 'active_support/configurable'

module FilepickerioRails
  # Configures global settings for FilepickerioRails
  #   FilepickerioRails.configure do |config|
  #     config.api_key = 'YOURKEY'
  #   end
  def self.configure(&block)
    yield @config ||= FilepickerioRails::Configuration.new
  end

  # Global settings for FilepickerioRails
  def self.config
    @config
  end

  # Do not access this class directly, use self.config
  class Configuration
    include ActiveSupport::Configurable
    config_accessor :api_key
  end

  # Initialize the configuration
  configure do |config|
    config.api_key = nil
  end
end