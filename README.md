filepickerio_rails
==================

Installation
------------

Add your Filepicker.io API Key to an initialiser (`config/initializer/filepickerio_rails.rb`):

    FilepickerioRails.configure do |config|
      config.api_key = '[YOUR API KEY FROM FILEPICKER.IO]'
    end

Include the filepicker.io JavaScript library in your page (such as your application.html.erb layout):

    <%= javascript_include_tag "//api.filepicker.io/v0/filepicker.js" %>

... or, if you're not using the asset pipeline, you can use the expansion:

    <%= javascript_include_tag :filepickerio %>

Render a Filepicker.io file upload and save fields using the form tag helper:

    <%= fp_file_field_tag :image_url, 'Pick file', 'http://example.com/existing-upload.jpg' %>
    <%= fp_file_field_tag :image_url, 'Pick file', 'http://example.com/existing-upload.jpg', 'image/jpg' %>
    <%= fp_file_field_tag :image_url, 'Pick file', 'http://example.com/existing-upload.jpg', 'image/jpg', { class: 'primary btn' } %>

    <%= fp_save_button 'Save to Dropbox', 'http://www.filepicker.io/static/img/success.png', 'image/jpg' %>
    <%= fp_save_button 'Save to Dropbox', 'http://www.filepicker.io/static/img/success.png', 'image/jpg', data: { 'fp-option-services' => 'DROPBOX' } %>

Or use the data-bound form builder methods, fp_file_field, fp_save_button:

    <%= form_for @entry do |f| %>
      <%= f.fp_file_field :image_url %>
      <%= f.fp_file_field :lolcat_image_url, "Upload lolcat" %>

      <%= f.fp_save_button :image_url, "Save existing image to cloud", 'image/jpg' %>
    <%- end %>

Filepicker.io Data Params
-------------------------

Pass a data hash as the last parameter to the helper methods to control the Filepicker.io widget.

See the documentation at [https://developers.filepicker.io/docs/web/](https://developers.filepicker.io/docs/web/)