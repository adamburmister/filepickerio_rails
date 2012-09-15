module FilepickerioRails
  class ::ActionView::Helpers::FormBuilder
    
    # Returns a input tag tailored for a Filepicker.io upload widget to be attached for the form object
    def fp_file(method, text=nil, options={})
      @template.fp_file(@object_name, method, text, options)
    end

    def fp_save_button(method, text, mime, options={}, &block)
      @template.fp_save_button(@object, method, text, mime, options, &block)
    end

  end
end