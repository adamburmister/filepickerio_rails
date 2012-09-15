if defined?(Rails)
  module FilepickerioRails
    class Railtie < Rails::Railtie

      # By running before_configuration we give users a chance to override within their rails config
      config.before_configuration do
        config.action_view.javascript_expansions[:filepickerio] = %w(//api.filepicker.io/v0/filepicker.js)
      end

      initializer 'filepickerio_rails.action_view' do
        ActiveSupport.on_load :action_view do
          require 'filepickerio_rails/action_view/form_builder'
          require 'filepickerio_rails/action_view/form_tag_helper'
        end
      end

    end
  end
end