class Inventory < ApplicationRecord
  validates :name,  :presence => true
  validates :description, :presence => true, :length => { :minimum => 5 }  
  
  belongs_to :category
  has_many :ingredient, dependent: :destroy
end
