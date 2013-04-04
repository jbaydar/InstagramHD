# == Schema Information
#
# Table name: photos
#
#  id             :integer          not null, primary key
#  img_id         :integer
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
end
