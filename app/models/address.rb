class Address < ApplicationRecord
    has_many :user

    validates :street_name, :city, :state, :zipcode, :country, presence: true
    validates :zipcode, length: {minimum: 5}
end
