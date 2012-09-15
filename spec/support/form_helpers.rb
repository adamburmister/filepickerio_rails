require 'action_view'
require 'action_view/template'

require 'filepickerio_rails/action_view/form_tag_helper'

module FormHelpers
  include ActionView::Helpers::FormHelper
  include ActionView::Context
  include ActionController::RecordIdentifier

  def protect_against_forgery?
    false
  end
end