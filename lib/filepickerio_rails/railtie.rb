module FilepickerioRails
  class Railtie < Rails::Railtie

    # By running before_configuration we give users a chance to override
    # within their rails config
    config.before_configuration do
      # If you're not using the asset pipeline you can use this javascript
      # expansion to include the Filepicker.io JS lib
      config.action_view.javascript_expansions[:filepickerio] = %w(//api.filepicker.io/v0/filepicker.js)
    end

    initializer 'filepickerio_rails.action_view' do
      ActiveSupport.on_load :action_view do
        # Load the helpers along with action_view
        # The _tag helper renders non-model bound tags
        require 'filepickerio_rails/action_view/form_tag_helper'
        # The form builder renders model bound field tags
        require 'filepickerio_rails/action_view/form_builder'
      end
    end

  end
end
