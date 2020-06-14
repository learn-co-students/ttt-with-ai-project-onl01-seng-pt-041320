# frozen_string_literal: true

class Board
  attr_accessor :cells
  def initialize
    reset!
  end

  def reset!
    @cells = Array.new(9, ' ')
  end
end
