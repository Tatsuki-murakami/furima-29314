class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to             :user
  has_one                :buy
  has_one_attached       :image
  belongs_to_active_hash :category
  belongs_to_active_hash :condition
  belongs_to_active_hash :day
  belongs_to_active_hash :area
  belongs_to_active_hash :shipping

  with_options presence: true do
    validates :image
    validates :name
    validates :describe
    validates :price,        numericality: {only_integer: true, greater_than: 299, less_than: 10_000_000}
  end

  with_options numericality: {other_than: 1, message: 'は空欄は受け付けません'} do
    validates :category_id
    validates :condition_id
    validates :day_id
    validates :area_id
    validates :shipping_id
  end
end
