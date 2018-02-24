class Ingredient < ApplicationRecord
  validates :name,  :presence => true
  validates :description, :presence => true, :length => { :minimum => 5 }
  
  belongs_to :inventory
end
