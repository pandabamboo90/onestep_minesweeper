class Board < ApplicationRecord

  serialize(:grid)

  # Associations
  belongs_to :user, dependent: :destroy

  # Validations
  validates_presence_of :name, :width, :height, :num_of_mines
  validates_uniqueness_of :name, scope: [:user]
  validates_numericality_of :width, :height, only_integer: true, greater_than_or_equal_to: 1
  validates_numericality_of :num_of_mines, only_integer: true, greater_than_or_equal_to: 0
  validate :num_of_mines, :in_range_of_grid?

  def in_range_of_grid?
    errors.add(:num_of_mines, "excesses the grid size") if num_of_mines > width * height
  end

  # Callbacks
  before_create :generate_grid

  def generate_grid
    self.grid = Array.new(width) { Array.new(height, "") }
    generated_pos_arr = []
    num_of_mines.times do |idx|
      generate_unique_mine_position(generated_array: generated_pos_arr, grid: self.grid)
    end

    self.grid = self.grid.to_json
  end

  def generate_unique_mine_position(generated_array:, grid:)
    x = rand(width)
    y = rand(height)
    pos = "#{x}:#{y}"

    # Using binary search here for best performance result
    if generated_array.bsearch_index{ |item| item == pos }
      # Re-gen the position because it already taken
      generate_unique_mine_position(generated_array: generated_array, grid: grid)
    else
      grid[x][y] = '*'
      generated_array << pos
    end
  end
end
