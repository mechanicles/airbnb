class HomeController < ApplicationController

  def index
    @featured_spaces = Space.featured
    @spaces = Space.unfeatured
  end

end
