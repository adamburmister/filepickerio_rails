require 'spec_helper'

describe FilepickerioRails::ActionView::FormHelper do
  describe "#filepickerio_save_button" do
    pending
  end

  describe "#filepickerio_field_tag" do

    context "form field" do
      # let :template do
      #   <<-EOTEMPLATE
      #     <%= form_for(user) do |f| %>
      #        <%= f.filepickerio_field(:avatar) %>
      #     <%- end -%>
      #   EOTEMPLATE
      # end

      # it "should render successfuly" do
      #   render(inline: template, locals: { user: user })
      #   rendered.should_not be_nil
      # end

      # it "should have a type of filepickerio" do
      #   render(inline: template, locals: { user: user })
      #   rendered.should have_xpath('//input[@type="filepicker"]')
      # end

      # it "should have the API key as a data property data-fp-apikey" do
      #   render(inline: template, locals: { user: user })
      #   rendered.should have_xpath("//input[@data-fp-apikey='#{test_api_key}']")
      # end

      describe "with dragdrop:true" do
        # let :template do
        #   <<-EOTEMPLATE
        #     <%= form_for(user) do |f| %>
        #        <%= f.filepickerio_field(:avatar, dragdrop: true) %>
        #     <%- end -%>
        #   EOTEMPLATE
        # end

        # it "should render the type as `filepicker-dragdrop`" do
        #   render(inline: template, locals: { user: user })
        #   rendered.should have_xpath('//input[@type="filepicker-dragdrop"]')
        # end
      end

      describe "with optional data params" do
      #   let :template do
      #     <<-EOTEMPLATE
      #       <%= form_for(user) do |f| %>
      #          <%= f.filepickerio_field(:avatar, data: { "data-fp-apikey" => "987654321", "data-fp-class" => "myCssClass", "data-fp-button-text" => "UploadFu" }) %>
      #       <%- end -%>
      #     EOTEMPLATE
      #   end

      #   it "should render any passed Filepicker.io configuration data options" do
      #     render(inline: template, locals: { user: user })
      #     rendered.should have_xpath('//input[@data-fp-class="myCssClass"]')
      #     rendered.should have_xpath('//input[@data-fp-button-text="UploadFu"]')
      #   end

      #   it "should override the API key outputted if passed" do
      #     render(inline: template, locals: { user: user })
      #     rendered.should have_xpath('//input[@data-fp-apikey="987654321"]')
      #   end
      end
    end

  end
end
