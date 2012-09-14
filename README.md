filepickerio-rails
==================

Add your Filepicker.io API Key to an initialiser

    FilepickerioRails.configure do |config|
      config.api_key = '[YOUR API KEY FROM FILEPICKER.IO]'
    end

Include the filepicker.io javascript in your page

    <%= javascript_include_tag "//api.filepicker.io/v0/filepicker.js" %>

Render Filepicker.io file upload and save fields like:

    <%= filepickerio_upload_tag :user, 'http://example.com/existing-upload.jpg' %>
	<%= filepickerio_save_button "Save to Dropbox", "http://www.filepicker.io/static/img/success.png", "image/jpg", data: { "fp-option-services" => "DROPBOX" } %>
