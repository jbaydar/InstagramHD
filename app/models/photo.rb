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
    @counter = 0;
    @max_id = nil;
    while @counter != 50
      @photos = Instagram.tag_recent_media("nyc", {max_id: @max_id})
      @photos.each do |p|
        break if @counter == 50;
        Photo.create(:img_id => p.id, :author_name => p.user.username, :instagram_link => p.link, :created_time => p.created_time, :thumb => p.images.thumbnail.url, :low_res => p.images.low_resolution.url, :standard_res => p.images.standard_resolution.url);
        @counter += 1;
      end
      @max_id = @photos.pagination.next_max_tag_id;
    end
  end

end
