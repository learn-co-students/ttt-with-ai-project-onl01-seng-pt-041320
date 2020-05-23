require 'pry'
module Players
    class Computer < Player
        @@used = []

        def move(board)
            random_number = rand(1..9)

            if board.cells[random_number] == " "
                #binding.pry
                random_number.to_s
            end

            # if board.cells[0] == " "
            #     "1"
            # elsif board.cells[1] == " "
            #     "2"
            # elsif board.cells[2] == " "
            #     "3"
            # elsif board.cells[3] == " "
            #     "4"
            # elsif board.cells[4] == " "
            #     "5"
            # elsif board.cells[5] == " "
            #     "6"
            # elsif board.cells[6] == " "
            #     "7"
            # elsif board.cells[7] == " "
            #     "8"
            # elsif board.cells[8] == " "
            #     "9"
            # end
        end
    end
end