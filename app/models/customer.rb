class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
    # 姓と名をDBに保存する前に結合
  has_many :orders, dependent: :destroy
  has_many :addresses, dependent: :destroy
  has_many :carts, dependent: :destroy

  def create_name
    first_name+" "+last_name
  end

  def create_name_f
    first_name_f+" "+last_name_f
  end
  
  def active_for_authentication?
    super && (flag == false)
  end
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

end
