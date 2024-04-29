class Photo < ApplicationRecord
    validates :title, presence: true
  
    def image_path
      "public/photo_images/#{id}.jpg"
    end
  end
