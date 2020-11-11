class Choice < ApplicationRecord
    has_many :user_choices, dependent: :destroy
    has_many :users, through: :user_choices

    has_many :choice_activities
    has_many :activities, through: :choice_activities

    validates :location_zip, length: {minimum: 5}
    validates :choice_name, :date, :location_zip, presence: true
end
