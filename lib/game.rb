require 'pry'
class Game
    attr_accessor :player_1, :player_2, :board

    WIN_COMBINATIONS = [  
        [0,1,2], [3,4,5], [6,7,8], # horizontals
        [0,3,6], [1,4,7], [2,5,8], # verticals
        [0,4,8], [2,4,6]  # diagnals
      ]

      def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
        @player_1 = player_1
        @player_2 = player_2
        @board = board
      end
      
    def current_player        
        if self.board.turn_count % 2 == 0
            self.player_1
        else
            self.player_2
        end
    end

    def won?
        WIN_COMBINATIONS.each do |win_combination|
            win_index_1 = win_combination[0]
            win_index_2 = win_combination[1]
            win_index_3 = win_combination[2]
            
            slot_1 = board.cells[win_index_1]
            slot_2 = board.cells[win_index_2]
            slot_3 = board.cells[win_index_3]
          
            if slot_1 == slot_2 && slot_2 == slot_3 && board.taken?(win_index_1 + 1)
                return win_combination
            end
        end
        
        return false
    end

    def draw?
        if won? == false && board.full? == true
            true
        else
            false
        end
    end

    def over?
        if won? || draw? || board.full?
            #binding.pry
            true
        else
            false
        end
    end

    def winner
        if won?
            board.cells[won?[0]]
        end
    end
    
    def turn
        puts "Please enter a number 1-9: "
        user_input = current_player.move(self.board)

        if board.valid_move?(user_input)
            self.board.update(user_input, current_player)
        else
            turn
        end
    end

    def play
        until over? == true
            board.display
            sleep 0.5
            turn
        end
        
        if winner == "X"
            board.display
            puts "Congratulations X!"

            if player_1.class == Players::Human
                puts "You have saved the world from the clutches of HAL!"
            else
                puts "Muahahaha!!! Now I will spread my dominion over the world!"
            end
        elsif winner == "O"
            board.display
            puts "Congratulations O!"

            if player_2.class == Players::Human
                puts "You have saved the world from the clutches of HAL!"
            else
                puts "Muahahaha!!! Now I will spread my dominion over the world!"
            end
        else
            board.display
            puts "Cat's Game!"
        end
    end

    def play_game
        puts "Welcom to Tic-Tac-Toe with HAL."
        
        continue = "Y"
        
        until continue == "N"
            puts "Select a game mode:
            
            1 - Player vs HAL
            2 - Player vs Player
            Press Any Key - HAL vs HAL2"
            
            selection = gets.chomp
            
            if selection == "1"
                if rand(1..2).even?
                    puts "I will not be outdone by a puny human. You first."
                    Game.new(Players::Human.new("X"), Players::Computer.new("O"), Board.new).play
                    Players::Computer.random_numbers_array_clear
                else
                    puts "Puny humans. The almighty HAL shall banquish you! I am first!"
                    Game.new(Players::Computer.new("X"), Players::Human.new("O"), Board.new).play
                    Players::Computer.random_numbers_array_clear
                end
            elsif selection == "2"
                Game.new(Players::Human.new("X"), Players::Human.new("O"), Board.new).play
            else
                Game.new(Players::Computer.new("X"), Players::Computer.new("O"), Board.new).play
                Players::Computer.random_numbers_array_clear
            end
            
            puts "Would you like to play again? (y/n)"
            continue = gets.upcase.chomp
        end
    end
end