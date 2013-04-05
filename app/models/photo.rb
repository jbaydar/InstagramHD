# == Schema Information
#
# Table name: photos
#
#  id             :integer          not null, primary key
#  img_id         :string(255)
#  author_name    :string(255)
#  instagram_link :string(255)
#  created_time   :integer
#  thumb          :string(255)
#  low_res        :string(255)
#  standard_res   :string(255)
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

class Photo < ActiveRecord::Base
  attr_accessible :img_id, :author_name, :instagram_link, :created_time, :thumb, :low_res, :standard_res

  def self.get_photos
    @photos = Instagram.tag_recent_media("nyc", {count: 50})
    @photos.each do |p|
      Photo.create(:img_id => p.id, :author_name => p.user.username, :instagram_link => p.link, :created_time => p.created_time, :thumb => p.images.thumbnail.url, :low_res => p.images.low_resolution.url, :standard_res => p.images.standard_resolution.url)
    end
  end
end
