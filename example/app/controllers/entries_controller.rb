class EntriesController < ApplicationController

  def index
  	@entry = Entry.new(:image_url => "http://www.example.com/draft-image.png")
  end

  def create
    raise params.inspect
  end

end
