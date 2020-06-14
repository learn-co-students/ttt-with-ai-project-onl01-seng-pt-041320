# frozen_string_literal: true

module Players
  class Human < Player
    def move(_board)
      puts 'Please enter 1-9:'
      gets.strip
    end
  end
end
