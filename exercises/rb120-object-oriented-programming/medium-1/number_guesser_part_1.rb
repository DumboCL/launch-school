class GuessingGame
  def play
    system('clear') || system('cls')
    reset_game

    loop do
      if remain_guess <= 0
        no_guess_result
        break
      else
        break if correct_guess?
        remain_guess_display
        user_guess
        compare_guess
      end
        win_result
      end
  end

  protected

  attr_accessor :remain_guess, :target, :guess, :win_result

  def remain_guess_display
    puts "You have #{remain_guess} guesses remaining."
  end

  def user_guess
    user_input = nil

    loop do
      puts "Enter a number between 1 and 100: "
      user_input = gets.chomp
      break if input_veryfied?(user_input)
      p "Invalid guess. "
    end
    
    reduce_remaining_guess
    self.guess = user_input.to_i
  end

  def reduce_remaining_guess
    self.remain_guess -= 1
  end

  def input_veryfied?(user_input)
    (1..100).include?(user_input.to_i)
  end

  def compare_guess
    case
    when guess == target
      result_is_win
    when guess > target
      puts "Your guess is too high."
    else 
      puts "Your guess is too low."
    end

    puts
  end

  def reset_game
    self.remain_guess = 7
    self.target = rand(1..100)
    self.win_result = false
  end

  def no_guess_result
    puts "You have no more guesses. You lost!"
  end

  def result_is_win
    puts "That's the number!"
    puts
    puts "You won!"
    self.win_result = true
  end

  def correct_guess?
    win_result
  end
end

game = GuessingGame.new
game.play

# You have 7 guesses remaining.
# Enter a number between 1 and 100: 104
# Invalid guess. Enter a number between 1 and 100: 50
# Your guess is too low.

# You have 6 guesses remaining.
# Enter a number between 1 and 100: 75
# Your guess is too low.

# You have 5 guesses remaining.
# Enter a number between 1 and 100: 85
# Your guess is too high.

# You have 4 guesses remaining.
# Enter a number between 1 and 100: 0
# Invalid guess. Enter a number between 1 and 100: 80

# You have 3 guesses remaining.
# Enter a number between 1 and 100: 81
# That's the number!

# You won!

# game.play

# You have 7 guesses remaining.
# Enter a number between 1 and 100: 50
# Your guess is too high.

# You have 6 guesses remaining.
# Enter a number between 1 and 100: 25
# Your guess is too low.

# You have 5 guesses remaining.
# Enter a number between 1 and 100: 37
# Your guess is too high.

# You have 4 guesses remaining.
# Enter a number between 1 and 100: 31
# Your guess is too low.

# You have 3 guesses remaining.
# Enter a number between 1 and 100: 34
# Your guess is too high.

# You have 2 guesses remaining.
# Enter a number between 1 and 100: 32
# Your guess is too low.

# You have 1 guesses remaining.
# Enter a number between 1 and 100: 32
# Your guess is too low.

# You have no more guesses. You lost!