class Move
  attr_reader :value

  VALID_CHOICES = { "r" => "rock",
                    "p" => "paper",
                    "sc" => "scissors",
                    "l" => "lizard",
                    "sp" => "spock" }

  WIN_LOSE_RELATIONS = { 'rock'     => ['scissors', 'lizard'],
                         'paper'    => ['rock', 'spock'],
                         'scissors' => ['paper', 'lizard'],
                         'lizard'   => ['spock', 'paper'],
                         'spock'    => ['scissors', 'rock'] }

  def initialize(choice)
    @value = choice
  end

  def >(other_move)
    WIN_LOSE_RELATIONS[self.value].include?(other_move.value)
  end

  def <(other_move)
    WIN_LOSE_RELATIONS[other_move.value].include?(self.value)
  end

  def to_s
    @value
  end

  def self.choice_verified?(choice_key)
    VALID_CHOICES.keys.include?(choice_key)
  end

  def self.choices_string
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
end

class Score
  attr_reader :points
  MAX_SCORE = 5

  def initialize
    @points = 0
  end

  def add_one_point
    @points += 1
  end

  def to_s
    @points.to_s
  end

  def self.max_points?(score1, score2)
    [score1.points, score2.points].max >= MAX_SCORE
  end
end

class Player
  attr_accessor :name, :move, :score

  def initialize
    set_name
    @score = Score.new
  end

  def win
    @score.add_one_point
  end
end

class Human < Player
  def set_name
    input_name = ""
    loop do
      puts "What's your name?"
      input_name = gets.chomp
      break unless input_name.empty?
      puts "Sorry, must enter a value."
    end
    self.name = input_name
  end

  def choose
    choice = nil
    loop do
      puts "Please type your choice: #{Move.choices_string}:"
      choice = gets.chomp
      break if Move.choice_verified?(choice)
      puts "Sorry, invalid choice."
    end
    self.move = Move.new(Move::VALID_CHOICES[choice])
  end
end

class Computer < Player
  def set_name
    self.name = ['R2D2', 'Hal', 'Chappie', 'Sonny', 'Number 5'].sample
  end

  def choose
    self.move = Move.new(Move::VALID_CHOICES.values.sample)
  end
end

# Game Orchestration Engine
class RPSGame
  attr_accessor :human, :computer, :winner

  def initialize
    @human = Human.new
    @computer = Computer.new
  end

  def clean_screen
    system "clear"
  end

  def display_welcome_message
    puts "#{human.name}, Welcome to Rock, Paper, Scissors, Lizard, Spock!"
    puts "The first player who reaches 5 wins gets the Trophy!"
  end

  def display_goodbye_message
    puts "Thanks for playing Rock, Paper, Scissors. Good bye!"
  end

  def display_moves
    puts "#{human.name} chose #{human.move}"
    puts "#{computer.name} chose #{computer.move}"
  end

  def determine_winner
    if human.move > computer.move
      puts "#{human.name} won!"
      self.winner = human.name
      human.win
    elsif human.move < computer.move
      puts "#{computer.name} won!"
      self.winner = computer.name
      computer.win
    else
      puts "It's a tie!"
    end
  end

  def display_result
    puts human.score
    puts computer.score
  end

  def has_final_winner?
    if Score.max_points?(human.score, computer.score)
      puts "#{self.winner} first reaches 5 wins."
      puts "#{self.winner} gets the Trophy!"
      return true
    end

    false
  end

  def play_again?
    answer = nil
    loop do
      puts "Would you like to play again? (y/n)"
      answer = gets.chomp
      break if ['y', 'n'].include?(answer.downcase)
      puts "Sorry, must be y or n"
    end

    return false if answer.downcase == 'n'
    return true if answer.downcase == 'y'
  end

  def play
    clean_screen
    display_welcome_message
    loop do
      human.choose
      computer.choose
      display_moves
      determine_winner
      display_result
      break if has_final_winner?
      break unless play_again?
      clean_screen
    end
    display_goodbye_message
  end
end

system "clear"
RPSGame.new.play
