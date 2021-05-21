class Address < ApplicationRecord
  belongs_to :order

  with_options presence: true do
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Enter it as follows (e.g. 123-4567)"}
    validates :prefecture_id, numericality: {other_than: 0 }
    validates :city
    validates :house_number
    validates :phone_number
  end

end
