class HomeController < ApplicationController

  def index
    @featured_spaces = Space.featured
    @spaces = Space.unfeatured

    respond_to do |format|
      format.html
      format.json { render json: { featured_spaces: @featured_spaces, spaces: @spaces } }
    end
  end

end
