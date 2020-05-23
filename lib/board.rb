require 'pry'
class Board
    attr_accessor :cells
    @cells = []

    def initialize
        self.cells = Array.new(9, " ")
        #@cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
    end

    def display
        puts " #{self.cells[0]} | #{self.cells[1]} | #{self.cells[2]} "
        puts "-----------"
        puts " #{self.cells[3]} | #{self.cells[4]} | #{self.cells[5]} "
        puts "-----------"
        puts " #{self.cells[6]} | #{self.cells[7]} | #{self.cells[8]} "
    end

    def reset!
        self.cells = Array.new(9, " ")
        #@cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "]

    end

    def position(user_input)
        self.cells[user_input.to_i - 1]
    end

    def full?
        self.cells.all? {|i| i == "X" || i == "O"}
    end

    def turn_count
        counter = 0
        
        self.cells.each do |board_space|
            if board_space == "X" || board_space == "O"
                counter += 1
            end
        end
        
        counter
    end

    def taken?(user_input)
        self.cells[user_input.to_i - 1] == "X" || self.cells[user_input.to_i - 1] == "O"
        #     true
        # else
        #     false
        # end
        # self.cells[user_input.to_i].nil? || self.cells[user_input.to_i] == " "
    end

    def valid_move?(user_input)
        if user_input.to_i >= 0 && user_input.to_i <= 8 && user_input.length == 1
            #binding.pry
            if taken?(user_input) == false
              true
            else
              print "Select another number 1-9: "
              false
            end
        else
            print "Select another number 1-9: "
            false
        end
    end

    def update(user_input, player)
        if valid_move?(user_input)
            self.cells[user_input.to_i - 1] = player.token
        end
    end
end