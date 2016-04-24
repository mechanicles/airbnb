class HomeController < ApplicationController

  def index
    @featured_speaces = Space.featured
    @spaces = Space.all
  end

end
