class Cart < ActiveRecord::Base
  belongs_to :customer
  belongs_to :item

  def sum_price
    item.price* count
  end
end
