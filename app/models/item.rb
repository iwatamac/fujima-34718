class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :delivery_area
  belongs_to :delivery_days
  belongs_to :responsibility
  belongs_to :user
  has_one_attached :image

  with_options presence: true do
    validates :name
    validates :description
    validates :category_id
    validates :condition_id
    validates :responsibility_id
    validates :delivery_area_id
    validates :delivery_days_id
    validates :price
    validates :image
  end

  with_options numericality: { other_than: 0 } do
    validates :category_id
    validates :condition_id
    validates :responsibility_id
    validates :delivery_area_id
    validates :delivery_days_id
  end


end
