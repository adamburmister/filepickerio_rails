module FilepickerioRails

  module ActionView
    # This module creates filepicker.io fields
    #
    # Example:
    #
    #     filepickerio_upload_tag :user, 'Pick file', 'http://example.com/existing-upload.jpg', data: { "fp-mimetypes": "image/jpg" }
    #
    module FormHelper
      def filepickerio_upload_tag(object_name, text=nil, value=nil, options={})
        if options[:dragdrop] && options[:dragdrop] == true
          type = 'filepicker-dragdrop'
        else
          type = 'filepicker'
        end

        # Add the data hash
        options = { 
          type: type,
          data: {}
        }.merge(options)

        options[:data].merge!({
          "fp-apikey" => "APOleFxLDSRibUgG3tdqvz",
          "fp-button-text" => text || 'Pick File'
        })

        hidden_field(object_name, value, options.stringify_keys)
      end

      def filepickerio_save_button(text = nil, url = nil, mime = nil, options = nil, &block)
        raise "URL of file to be saved must be set" if url.nil?
        raise "Mime type of file to be saved must be set" if mime.nil?

        options ||= { data: {} }
        options[:data].merge!({
          "fp-apikey" => "APOleFxLDSRibUgG3tdqvz",
          "fp-url" => url,
          "fp-mimetype" => mime
        })

        button_tag(text, options, &block)
      end
    end
  end
end

ActionView::Base.send :include, FilepickerioRails::ActionView::FormHelper