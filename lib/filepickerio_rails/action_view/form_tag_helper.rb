module FilepickerioRails
  module ActionView

    # This module creates filepicker.io fields
    #
    # Examples:
    #
    #     filepickerio_upload_tag :user, 'Pick file', 'http://example.com/existing-upload.jpg', data: { "fp-mimetypes": "image/jpg" }
    #
    #     filepickerio_save_button_tag 'Save file to cloud', 'http://example.com/existing-upload.jpg', 'image/jpeg'
    #
    module FormTagHelper

      def fp_file_tag(object_name, text=nil, value=nil, options={})
        dragdrop = options[:dragdrop] && options[:dragdrop] == true
        input_type = (dragdrop ? 'filepicker-dragdrop' : 'filepicker')

        filepickerio_options = { 
          type: input_type,
          data: {
            "fp-apikey" => fp_api_key,
            "fp-button-text" => text || 'Pick File'
          }
        }

        text_field_tag(object_name, value, options.deep_merge(filepickerio_options).stringify_keys)
      end

      def fp_save_tag(content_or_options=nil, url=nil, mime=nil, options=nil, &block)
        raise "URL of file to be saved must be set" if url.nil?
        raise "Mime type of file to be saved must be set" if mime.nil?

        options = content_or_options if block_given? && content_or_options.is_a?(Hash)
        options ||= {}
        options = options.stringify_keys

        filepickerio_options = { 
          data: {
            "fp-apikey" => fp_api_key,
            "fp-url" => url,
            "fp-mimetype" => mime
          } 
        }

        button_tag(content_or_options || 'Save file', options.deep_merge(filepickerio_options), &block)
      end

    private

      def fp_api_key
        raise "Filepicker.io API Key not set. Check config/initializer/filepickerio_rails.rb" if !FilepickerioRails.config.api_key
        FilepickerioRails.config.api_key
      end

    end
  end
end

ActionView::Base.send :include, FilepickerioRails::ActionView::FormTagHelper