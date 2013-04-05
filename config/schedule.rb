every 1.hour do
  runner "Photo.get_photos", :environment => :development
end