class Account < ActiveRecord::Base
  authenticates_with_sorcery!

  has_many :users, dependent: :destroy
  accepts_nested_attributes_for :users

  has_many :projects, dependent: :destroy

end
