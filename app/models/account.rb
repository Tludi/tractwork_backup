class Account < ActiveRecord::Base
  authenticates_with_sorcery!
  
  has_many :users, dependent: :destroy
  accepts_nested_attributes_for :users, :reject_if => lambda { |a| a[:content].blank? }, :allow_destroy => true

end
