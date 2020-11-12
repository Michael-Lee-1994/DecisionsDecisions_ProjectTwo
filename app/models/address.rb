class Address < ApplicationRecord
    has_many :users

    validates :street_name, :city, :state, :zipcode, :country, presence: true
    validates :zipcode, length: {minimum: 5}
end
