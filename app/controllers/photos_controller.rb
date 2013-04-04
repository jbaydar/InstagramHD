class PhotosController < ApplicationController
  def index
    @videos = Video.all
  end

  def new
  end

  def search

    lis = html.css('#search-results li')
    lis.each do |li|
      url = li.get_attribute('data-context-item-id')
      # views = li.get_attribute('data-context-item-views')
      title = li.get_attribute('data-context-item-title')
      Photo.create(:img_id => data.id, :author_name => data.user.username, :instagram_link => data.link, :created_time => data.created_time, :thumb => data.images.thumbnail.url, :low_res => data.images.low_resolution.url, :standard_res => data.images.standard_resolution.url)
    end
  end
end