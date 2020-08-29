# frozen_string_literal: true

require_relative '../player.rb'
module Players
  class Human < Player
    def move(board)
      puts("Enter Input.")
      input = gets.strip
    end
  end
end
