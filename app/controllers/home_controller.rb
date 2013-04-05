class HomeController < ApplicationController
  def index
    @photosShow = Photo.order('created_at DESC').all
  end
end