class Item < ApplicationRecord
   has_one_attached :image
   has_many :order_items, dependent: :destroy
   has_many :carts, dependent: :destroy
   belongs_to :goods_genre
   validates :price, presence: true

  scope :recent, -> {order(create_at: :desc) }

   def add_tax_sales_price
        (self.price * 1.1).round.to_s(:delimited)
   end

   def get_image(width, height)
      unless image.attached?
        file_path = Rails.root.join('app/assets/images/cake-1.jpg')
        image.attached(io: File.open(file_path),filename: 'default-image.jpg',content_type: 'image/jpeg')
      end
      image.variant( gravity: :center, resize:"#{width} x #{height}^", crop:"#{width} x #{height}+0+0")
   end
end
