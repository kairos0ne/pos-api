class Category < ApplicationRecord
    validates :name,  :presence => true
    validates :description, :presence => true, :length => { :minimum => 5 }

    has_many :inventory, dependent: :destroy

    
end
