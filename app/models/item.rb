class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  has_one :buy
  belongs_to :user
  belongs_to :category
  belongs_to :status
  belongs_to :delivery_fee
  belongs_to :prefectures
  belongs_to :shipment_day
  has_one_attached :image

  with_options presence: true do
    validates :name
    validates :text
    validates :image
    validates :price, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999}
  end

  with_options numericality: { other_than: 1 , message: "can't be blank" } do
    validates :category_id
    validates :status_id
    validates :delivery_fee_id
    validates :prefectures_id
    validates :shipment_day_id
  end
end