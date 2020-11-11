class Activity < ApplicationRecord
    has_many :choice_activities, dependent: :destroy
    has_many :choices, through: :choice_activities
    ARR = ["food", "movie"]

    validates :category, inclusion: {in: ARR}
end
