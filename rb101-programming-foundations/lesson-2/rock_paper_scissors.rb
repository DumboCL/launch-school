# rock, paper, scissors, lizard, spock version
require 'pry'

VALID_CHOICES = { "r" => "rock",
                  "p" => "paper",
                  "sc" => "scissors",
                  "l" => "lizard",
                  "sp" => "spock" }

WIN_LOSE_RELATIONS = { 'rock' => ['scissors', 'lizard'],
                       'paper' => ['rock', 'spock'],
                       'scissors' => ['paper', 'lizard'],
                       'lizard' => ['spock', 'paper'],
                       'spock' => ['scissors', 'rock'] }

def clear_screen
  system('clear') || system('cls')
end

def prompt(message)
  Kernel.puts("=> #{message}")
end

def choice_veryfied?(choice_key)
  VALID_CHOICES.keys.include?(choice_key)
end

def once_again_veryfied?(choose)
  /^[YyNn]$/.match(choose)
end

def choices_string
  choices_string = ''
  VALID_CHOICES.each do |key, value|
    choices_string << "'"
    choices_string << key
    choices_string << "' for "
    choices_string << value
    choices_string << ', '
  end

  choices_string[0...-2]
end

def retrieve_choice(input_choice)
  VALID_CHOICES[input_choice]
end

def read_user_choice
  input_choice = nil

  loop do
    prompt("Please type your choice: #{choices_string}")
    input_choice = Kernel.gets().chomp()
    if choice_veryfied?(input_choice)
      break
    else
      prompt("That's not a valid choice.")
    end
  end

  retrieve_choice(input_choice)
end

def read_computer_choice
  VALID_CHOICES.values.sample
end

def game_winner(player, computer)
  winner = if player.eql? computer
             "tie"
           elsif WIN_LOSE_RELATIONS[player].include? computer
             "user"
           else
             "computer"
           end
  winner
end

def update_scores(winner, scores)
  if winner.eql? "tie"
    scores.each { |key, _| scores[key] += 0.5 }
  else
    scores[winner] += 1
  end
end

def display_results(winner)
  case winner
  when "tie"
    puts "It's a tie!"
  when "user"
    puts "You won!"
  when "computer"
    puts "Computer won!"
  end
end

def game_end?(scores)
  scores.value?(5) || scores.value?(5.5)
end

def display_scores(winner, scores)
  puts "*******************"
  scores.each do |key, value|
    puts "#{key} scores #{value}"
  end
  puts "*******************"

  if game_end?(scores)
    if scores["user"] == scores["computer"]
      puts "Both you and computer are Grand Winners."
    elsif winner.eql? 'user'
      puts "Congratulations, you are the Grand Winner."
    else
      puts "Congratulations, the computer is the Grand Winner."
    end
  end
end

def once_again?
  response = nil

  loop do
    prompt("Do you want to continue?('y' to continue, 'n' to quit.)")
    response = Kernel.gets().chomp()
    if once_again_veryfied?(response)
      break
    else
      prompt('This is not an invalid input, please try again.')
    end
  end

  once_again = response.downcase() == 'y'
  once_again
end

clear_screen
scores = { "user" => 0,
           "computer" => 0 }

prompt("Welcome to Rock, Paper, Scissors, Lizard, Spock!")

loop do
  user_choice = read_user_choice
  computer_choice = read_computer_choice
  prompt("You chose: #{user_choice}; Computer chose: #{computer_choice}")

  winner = game_winner(user_choice, computer_choice)
  update_scores(winner, scores)

  display_results(winner)
  display_scores(winner, scores)

  if game_end?(scores)
    break
  else
    break unless once_again?
  end
  puts ''
end

prompt("Thank you for playing! Good bye.")
