module FilepickerioRails
  class FormBuilder < ::ActionView::Helpers::FormBuilder
    # Returns a input tag tailored for a Filepicker.io upload widget to be attached for the form object
    def filepickerio_field(object_name, method, options = {})
      @template.filepickerio_field_tag(object_name, method, self, options.delete(:object)).to_input_field_tag("filepicker", options)
    end
    
  end
end