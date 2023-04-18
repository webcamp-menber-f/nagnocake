class Item < ApplicationRecord
   has_one_attached :image
   has_many :order_item
   has_many :cart
   belongs_to :goods_genre 
   
   
   def get_image
      unless image.attached?
        file_path = Rails.root.join('app/assets/images/cake-1.jpg')
        image.attached(io: File.open(file_path),filename: 'default-image.jpg',content_type: 'image/jpeg')
      end
     image.variant(resize_to_limit: [width, height]).processed
   end
end
