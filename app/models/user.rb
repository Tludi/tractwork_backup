class User < ActiveRecord::Base
  authenticates_with_sorcery!

  validates :password, length: {minimum: 6}, if: -> { new_record? || changes["password"]}
  validates :password, confirmation: true, if: -> { new_record? || changes["password"]}
  validates :password_confirmation, presence: true, if: -> { new_record? || changes["password"]}

  validates :email, uniqueness: true

  belongs_to :account
  has_many :workdays
  has_many :projects, through: :workdays
end
