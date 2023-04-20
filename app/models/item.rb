class Item < ApplicationRecord
   has_one_attached :image
   has_many :order_item, dependent: :destroy
   has_many :cart, dependent: :destroy
   belongs_to :goods_genre
   validates :price, presence: true


   def add_tax_sales_price
        (self.price * 1.1).round
   end

   def get_image(width, height)
      unless image.attached?
        file_path = Rails.root.join('app/assets/images/cake-1.jpg')
        image.attached(io: File.open(file_path),filename: 'default-image.jpg',content_type: 'image/jpeg')
      end
     image.variant(resize_to_limit: [width, height]).processed
   end
end
