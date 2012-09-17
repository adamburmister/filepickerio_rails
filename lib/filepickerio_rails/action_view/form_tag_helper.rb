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

      def fp_file_field_tag(object_name, text_or_options=nil, value_or_options=nil, options={})
        # Allow users to pass in variable length arguments
        if text_or_options.is_a? Hash
          # Nothing passed but options
          text = nil
          value = nil
          options = text_or_options
        elsif value_or_options.is_a? Hash
          # only text and options
          text = text_or_options
          value = nil
          options = value_or_options
        else
          # full params
          text = text_or_options
          value = value_or_options
          # options = options
        end

        options.merge!(
          # This avoids the ActiveModel naming of `object_name[method]`
          id: object_name,
          name: object_name,
          value: value
        )

        fp_file_field(object_name, nil, text, options)
      end

      def fp_file_field(object_name, method, text_or_options, options)
        if text_or_options.is_a? Hash
          text = nil
          options = text_or_options
        else
          text = text_or_options
        end

        dragdrop = options[:dragdrop] && options[:dragdrop] == true

        input_type = if dragdrop
          options.delete(:dragdrop)
          'filepicker-dragdrop'
        else
          'filepicker'
        end

        options = { 
          type: input_type,
          size: nil,
          data: {
            "fp-apikey" => fp_api_key,
            "fp-button-text" => text || 'Pick File'
          }
        }.deep_merge(options)

        ::ActionView::Helpers::InstanceTag.new(object_name, method, self, options.delete(:object)).to_input_field_tag(input_type, options)
      end

      def fp_save_button_tag(content=nil, url=nil, mime=nil, options=nil, &block)
        raise "URL of file to be saved must be set" if url.nil?

        options.deep_merge!({ 
            data: {
              "fp-url" => url
            } 
          })

        fp_save_button(nil, nil, content, mime, options, &block)
      end

      def fp_save_button(object, method, content=nil, mime=nil, options={}, &block)
        raise "Mime type of file to be saved must be set" if mime.nil?

        value = options[:value]
        if object && method
          if !value
            value = options.fetch(:value){ ::ActionView::Helpers::InstanceTag::value_before_type_cast(object, method.to_s) }
            value &&= ERB::Util.html_escape(value)
          end
        end

        options = { 
          name: nil,
          type: 'button',
          data: {
            "fp-apikey" => fp_api_key,
            "fp-mimetype" => mime,
            "fp-url" => value
          } 
        }.deep_merge(options)

        # Convert services array into string
        if options[:data]['fp-option-services'].is_a? Array
          options[:data]['fp-option-services'] = options[:data]['fp-option-services'].join(',')
        end

        button_tag(content || 'Save file', options, &block)
      end

    private

      def fp_api_key
        raise "Filepicker.io API Key not set" if !FilepickerioRails.config.api_key
        FilepickerioRails.config.api_key
      end

    end
  end
end

ActionView::Base.send :include, FilepickerioRails::ActionView::FormTagHelper