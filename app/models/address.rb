class Address < ApplicationRecord
  belongs_to :cricket
   validates :house, :street, :landmark, :city, :state, :pincode, :country, presence: true
end
