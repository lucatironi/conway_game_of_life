require 'cell'

# A grid of Cells
class Board
  DEFAULT_SIZE = 10
  attr_reader :cells

  def initialize(seed = nil)
    seed ||= Array.new(DEFAULT_SIZE) do
      Array.new(DEFAULT_SIZE) do
        [LiveCell.new, DeadCell.new][rand(0..1)]
      end
    end
    @cells = seed
  end

  def cell_at(x, y)
    @cells[x] && @cells[x][y] || DeadCell.new
  end

  def alive_neighbors(x, y)
    count = 0
    (-1..1).each do |offset_x|
      (-1..1).each do |offset_y|
        next if offset_x.zero? && offset_y.zero?
        count += 1 if cell_at(x + offset_x, y + offset_y).alive?
      end
    end
    count
  end

  def tick!
    new_generation = @cells.map.with_index do |rows, x|
      rows.map.with_index do |cell, y|
        cell.evolve!(alive_neighbors(x, y))
      end
    end
    Board.new(new_generation)
  end

  def print
    s = "\n"
    @cells.each do |rows|
      rows.each do |cell|
        s << (cell.alive? ? '#' : '.')
      end
      s << "\n"
    end
    puts s
  end
end
