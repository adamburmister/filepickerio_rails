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

      def fp_file_tag(object_name, text_or_options=nil, value_or_options=nil, options={})
        if text_or_options.is_a? Hash
          text = value = nil
          options = text_or_options
        elsif value_or_options.is_a? Hash
          value = nil
          options = value_or_options
        else
          text = text_or_options
          value = value_or_options
        end

        options.merge!(
          # This avoids the ActiveModel naming of `object_name[method]`
          id: object_name,
          name: object_name,
          value: value
        )

        fp_file(object_name, nil, text, options)
      end

      def fp_file(object_name, method, text, options)
        dragdrop = options[:dragdrop] && options[:dragdrop] == true

        input_type = if dragdrop
          options.delete(:dragdrop)
          'filepicker-dragdrop'
        else
          'filepicker'
        end

        filepickerio_options = { 
          type: input_type,
          size: nil,
          data: {
            "fp-apikey" => fp_api_key,
            "fp-button-text" => text || 'Pick File'
          }
        }
        options.deep_merge!(filepickerio_options)

        ::ActionView::Helpers::InstanceTag.new(object_name, method, self, options.delete(:object)).to_input_field_tag(input_type, options)
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

      def fp_save(object_name, method, content_or_options=nil, url=nil, mime=nil, options=nil, &block)
        
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