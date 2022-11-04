class Menu < ApplicationRecord
 # belongs_to :dining_hall
  validates :name, presence: true
  validates :calories, numericality: true, comparison: { greater_than_or_equal_to: 0 }
end
