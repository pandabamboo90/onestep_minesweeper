class Board < ApplicationRecord

  # Associations
  belongs_to :user

  # Validations
  validates_presence_of :name, :width, :height, :num_of_mines
  validates_uniqueness_of :name, scope: [:user]
  validates_numericality_of :width, :height, only_integer: true, greater_than_or_equal_to: 1
  validates_numericality_of :num_of_mines, only_integer: true, greater_than_or_equal_to: 0
end
