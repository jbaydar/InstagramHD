class AddPhotosTable < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.integer :img_id
      t.string :author_name
      t.string :instagram_link
      t.integer :created_time
      t.string :thumb
      t.string :low_res
      t.string :standard_res
      t.timestamps
    end
  end
end