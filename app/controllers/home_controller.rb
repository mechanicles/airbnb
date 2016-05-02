class HomeController < ApplicationController

  def index
    @featured_spaces = Space.featured
    @unfeatured_spaces = Space.unfeatured

    respond_to do |format|
      format.html
      format.json { render json: { featured_spaces: @featured_spaces.as_json(current_user: current_user),
                                   unfeatured_spaces: @unfeatured_spaces.as_json(current_user: current_user)} }
    end
  end

end
