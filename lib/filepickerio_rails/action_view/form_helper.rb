# encoding: utf-8

module FilepickerioRails

  module ActionView
    # This module creates filepicker.io fields
    #
    # Example:
    #
    #     filepickerio_upload_tag :user, nil, data: { "fp-mimetypes": "image/jpg" }
    #
    module FormHelper
      def filepickerio_upload_tag(name, value=nil, options = {})
        if options[:dragdrop] && options[:dragdrop] == true
          type = 'filepicker-dragdrop'
        else
          type = 'filepicker'
        end

        options.merge!({ data:{} }) if !options[:data]
        options[:data].merge!({
          "fp-apikey" => "APOleFxLDSRibUgG3tdqvz"
        })

        # TODO: Modify this to make it Filepicker.io-widget-compatible
        text_field_tag(name, value, options.stringify_keys.update("type" => "filepickerio"))
      end

      def filepickerio_save_button(content_or_options = nil, url = nil, mime = nil, options = nil, &block)
        raise "URL of file to be saved must be set" if url.nil?
        raise "Mime type of file to be saved must be set" if mime.nil?

        options ||= { data: {} }
        options[:data].merge!({
          "fp-apikey" => "APOleFxLDSRibUgG3tdqvz",
          "fp-url" => url,
          "fp-mimetype" => mime
        })

        button_tag(content_or_options, options, &block)
      end
    end
  end
end

ActionView::Base.send :include, FilepickerioRails::ActionView::FormHelper