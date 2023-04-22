class OrderItem < ApplicationRecord
  belongs_to :order
  belongs_to :item
  
  enum status: { cannot_start: 0, waiting_for_production: 1, in_production: 2, completon_of_production: 3 }
end
