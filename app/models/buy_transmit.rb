class BuyTransmit
  include ActiveModel::Model
  attr_accessor :postal_code, :prefectures_id, :city, :address, :building_name, :telephone, :user_id, :item_id, :token,
                :price

  with_options presence: true do
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Include hyphen(-)' }
    validates :user_id, :item_id
    validates :city, :address, :token
    validates :telephone, format: { with: /\A^(0{1}\d{9,10})$\z/, message: 'is invalid. Please enter again' }
  end
  validates :prefectures_id, numericality: { other_than: 1, message: "can't be blank" }

  def save
    buy = Buy.create(user_id: user_id, item_id: item_id)
    Transmit.create(postal_code: postal_code, prefectures_id: prefectures_id, city: city, address: address,
                    building_name: building_name, telephone: telephone, buy_id: buy.id)
  end
end
