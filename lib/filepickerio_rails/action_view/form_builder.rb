module FilepickerioRails
  class ::ActionView::Helpers::FormBuilder
    
    # Returns a input tag tailored for a Filepicker.io upload widget to be attached for the form object
    def fp_file(method, text=nil, options={})
      # The tag helper interface is fp_file_tag(object_name, text=nil, value=nil, options={})
      @template.fp_file(@object_name, method, text, options)
    end

  end
end