class Order < ApplicationRecord
  validates :total,  :presence => true

  belongs_to :table
  has_many :item, dependent: :destroy
end
