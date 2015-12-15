class Project < ActiveRecord::Base

  belongs_to :account
  has_many :workdays
  has_many :users, through: :workdays
  
end
