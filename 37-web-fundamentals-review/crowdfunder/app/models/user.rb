class User < ActiveRecord::Base
  authenticates_with_sorcery!
  has_many :pledges
  has_many :rewards, through: :pledges

  validates :password, length: { minimum: 8 }, on: :create
  validates :password, confirmation: true, on: :create
  validates :password_confirmation, presence: true, on: :create

  validates :email, uniqueness: true

  def full_name
    "#{first_name} #{last_name}"
  end
end
