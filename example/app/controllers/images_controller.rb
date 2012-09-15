class ImagesController < ApplicationController

  def index
	@entry = Entry.new(:image_url => "http://www.example.com/draft-image.png")    
  end

end
