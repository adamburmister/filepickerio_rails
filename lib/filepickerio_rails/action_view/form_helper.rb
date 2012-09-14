# encoding: utf-8

module FilepickerioRails

  module ActionView
    # This module creates filepicker.io fields
    #
    # Example:
    #
    #     TODO
    #
    module FormHelper
      def filepickerio_field_tag(name, value=nil, options = {})
        # TODO: Modify this to make it Filepicker.io-widget-compatible
        text_field_tag(name, value, options.stringify_keys.update("type" => "filepickerio"))
      end

      def filepickerio_save_button(content_or_options = nil, url = nil, mime = nil, options = nil, &block)
        raise "URL of file to be saved must be set" if url.nil?
        raise "Mime type of file to be saved must be set" if mime.nil?

        options.merge!({
          data: {
            url: url,
            mime: mime
          }
        })
        
        button_tag(content_or_options, options, block)
      end
    end
  end
end

ActionView::Base.send :include, FilepickerioRails::ActionView::FormHelper