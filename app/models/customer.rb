class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
    # 姓と名をDBに保存する前に結合
  has_many :order, dependent: :destroy
  has_many :address, dependent: :destroy
  has_many :cart, dependent: :destroy

  def create_name
    first_name+" "+last_name
  end

  def create_name_f
    first_name_f+" "+last_name_f
  end
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

end
