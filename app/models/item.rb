class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to             :user
  has_one                :buy
  has_one_attached       :image
  belongs_to_active_hash :category
  belongs_to_active_hash :status
  belongs_to_active_hash :day
  belongs_to_active_hash :area
  belongs_to_active_hash :shipping

  with_options presence: true do
    validates :image
    validates :name
    validates :describe
    validates :category_id, numericality: {other_than: 1, message: 'は空欄は受け付けません'}
    validates :status_id,   numericality: {other_than: 1, message: 'は空欄は受け付けません'}
    validates :day_id,      numericality: {other_than: 1, message: 'は空欄は受け付けません'}
    validates :area_id,     numericality: {other_than: 1, message: 'は空欄は受け付けません'}
    validates :shipping_id, numericality: {other_than: 1, message: 'は空欄は受け付けません'}
    validates :price,       numericality: {only_integer: true, greater_than: 299, less_than: 10_000_000}
  end

end
