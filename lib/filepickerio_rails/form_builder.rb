# encoding: utf-8

module FilepickerioRails
  class FormBuilder < ::ActionView::Helpers::FormBuilder
    # Returns a input tag tailored for a Filepicker.io upload widget to be attached for the form object
    def fp_file(object_name, method, options = {})
      @template.fp_file_tag(object_name, method, self, options.delete(:object))
    end
  end
end