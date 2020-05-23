require 'pry'
module Players
    class Computer < Player
        @@random_numbers_array = []

        def self.random_numbers_array_clear
            @@random_numbers_array.clear
        end

        def move(board)
            if @@random_numbers_array.empty?
                until @@random_numbers_array.length == 9
                    random_number = rand(1..9)
                    
                    @@random_numbers_array << random_number
                    @@random_numbers_array.uniq!
                end
            end

            #binding.pry

            if !board.taken?(@@random_numbers_array[0])
                #binding.pry
                "#{@@random_numbers_array[0].to_s}"
            elsif !board.taken?(@@random_numbers_array[1])
                "#{@@random_numbers_array[1].to_s}"
            elsif !board.taken?(@@random_numbers_array[2])
                "#{@@random_numbers_array[2].to_s}"
            elsif !board.taken?(@@random_numbers_array[3])
                "#{@@random_numbers_array[3].to_s}"
            elsif !board.taken?(@@random_numbers_array[4])
                "#{@@random_numbers_array[4].to_s}"
            elsif !board.taken?(@@random_numbers_array[5])
                "#{@@random_numbers_array[5].to_s}"
            elsif !board.taken?(@@random_numbers_array[6])
                "#{@@random_numbers_array[6].to_s}"
            elsif !board.taken?(@@random_numbers_array[7])
                "#{@@random_numbers_array[7].to_s}"
            elsif !board.taken?(@@random_numbers_array[8])
                "#{@@random_numbers_array[8].to_s}"
            end

            # if board.taken?[@@random_numbers_array[0]]
            #     "#{@@random_numbers_array[0].to_s}"
            # elsif board.taken?[@@random_numbers_array[1]]
            #     "#{@@random_numbers_array[1].to_s}"
            # elsif board.taken?[@@random_numbers_array[2]]
            #     "#{@@random_numbers_array[2].to_s}"
            # elsif board.taken?[@@random_numbers_array[3]]
            #     "#{@@random_numbers_array[3].to_s}"
            # elsif board.taken?[@@random_numbers_array[4]]
            #     "#{@@random_numbers_array[4].to_s}"
            # elsif board.taken?[@@random_numbers_array[5]]
            #     "#{@@random_numbers_array[5].to_s}"
            # elsif board.taken?[@@random_numbers_array[6]]
            #     "#{@@random_numbers_array[6].to_s}"
            # elsif board.taken?[@@random_numbers_array[7]]
            #     "#{@@random_numbers_array[7].to_s}"
            # elsif board.taken?[@@random_numbers_array[8]]
            #     "#{@@random_numbers_array[8].to_s}"
            # end
            # random_number = rand(1..9)

            # if board.taken?[random_number] == " "
            #     #binding.pry
            #     puts random_number.to_s
            #     random_number.to_s
            # end

            # if board.taken?[0] == " "
            #     "1"
            # elsif board.taken?[1] == " "
            #     "2"
            # elsif board.taken?[2] == " "
            #     "3"
            # elsif board.taken?[3] == " "
            #     "4"
            # elsif board.taken?[4] == " "
            #     "5"
            # elsif board.taken?[5] == " "
            #     "6"
            # elsif board.taken?[6] == " "
            #     "7"
            # elsif board.taken?[7] == " "
            #     "8"
            # elsif board.taken?[8] == " "
            #     "9"
            # end
        end
    end
end