class User < ApplicationRecord
  has_secure_password

  belongs_to :address, optional: true
  has_many :user_choices, dependent: :destroy
  has_many :choices, through: :user_choices

  validates :first_name, :last_name, :password, presence: true
  validates :username, length: {minimum: 6}, uniqueness: true
  validates :password, length: {minimum: 6}

  def to_s
    self.first_name.capitalize + " " + self.last_name.capitalize
  end
end
