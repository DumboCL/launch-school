class Move
  attr_reader :value

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

  def initialize(choice)
    @value = choice
  end

  def >(other)
    WIN_LOSE_RELATIONS[value].include?(other.value)
  end

  def <(other)
    WIN_LOSE_RELATIONS[other.value].include?(value)
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

  MAX_POINTS = 5

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
    [score1.points, score2.points].max >= MAX_POINTS
  end
end

class Player
  attr_accessor :name, :move, :score, :moves_history

  def initialize
    set_name
    @score = Score.new
    @moves_history = []
  end

  def win
    score.add_one_point
  end

  def choose
    update_history
  end

  def update_history
    moves_history << move
  end
end

class Human < Player
  def set_name
    input_name = ''
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
    super
  end
end

class Computer < Player
  def choose
    self.move = Move.new(Move::VALID_CHOICES.values.sample)
    super
  end
end

class R2d2 < Computer
  def set_name
    self.name = 'R2D2'
  end

  def choose
    self.move = Move.new(Move::VALID_CHOICES['r'])
    update_history
  end
end

class Hal < Computer
  def set_name
    self.name = 'Hal'
  end

  def choose
    self.move = Move.new(choices.sample)
    update_history
  end

  def choices
    choices = [Move::VALID_CHOICES['r']]
    choices += [Move::VALID_CHOICES['sc']] * 5
    choices += [Move::VALID_CHOICES['l']] * 2
    choices += [Move::VALID_CHOICES['sp']] * 2
    choices
  end
end

class Chappie < Computer
  def set_name
    self.name = 'Chappie'
  end
end

class Sonny < Computer
  def set_name
    self.name = 'Sonny'
  end
end

class Number5 < Computer
  def set_name
    self.name = 'Number 5'
  end
end

# Game Orchestration Engine
class RPSGame
  attr_accessor :human, :computer, :last_round_winner

  TABLE_WIDTH = 27
  COLUMN_WIDTH = TABLE_WIDTH / 3
  ROBOTS = [R2d2, Hal, Chappie, Sonny, Number5]

  def initialize
    @human = Human.new
    @computer = ROBOTS.sample.new
  end

  def start
    clear_screen
    display_welcome_message
    play_game
    display_goodbye_message
  end

  private

  def clear_screen
    system "clear"
  end

  def display_welcome_message
    puts "#{human.name}, Welcome to Rock, Paper, Scissors, Lizard, Spock!"
    puts "The first player who reaches 5 wins gets the Trophy!"
  end

  def display_goodbye_message
    puts "Thanks for playing Rock, Paper, Scissors, Lizard, Spock. Good bye!"
  end

  def players
    [human, computer]
  end

  def display_moves
    players.each do |player|
      puts "#{player.name} chose #{player.move}"
    end
  end

  def determine_winner(human, computer)
    if human.move > computer.move
      human
    elsif human.move < computer.move
      computer
    end
  end

  def display_winner
    self.last_round_winner = determine_winner(human, computer)
    if !last_round_winner
      puts "It's a tie!"
    else
      puts "#{last_round_winner.name} won!"
      last_round_winner.win
    end
  end

  def current_round_amount
    human.moves_history.size
  end

  def display_double_lines
    puts "=" * TABLE_WIDTH
  end

  def display_single_lines
    puts "-" * TABLE_WIDTH
  end

  def display_header
    header = ''.rjust(COLUMN_WIDTH, ' ')
    players.each { |player| header += player.name.rjust(COLUMN_WIDTH, ' ') }
    puts header
  end

  def display_scores
    scores = 'scores'.ljust(COLUMN_WIDTH, ' ')
    players.each do |player|
      scores += player.score.to_s.rjust(COLUMN_WIDTH, ' ')
    end
    puts scores
  end

  def display_history
    1.upto(current_round_amount) do |round|
      round_line = "round #{round}".ljust(COLUMN_WIDTH, ' ')
      players.each do |player|
        history = player.moves_history
        round_line += history[round - 1].to_s.rjust(COLUMN_WIDTH, ' ')
      end
      puts round_line
    end
  end

  def display_scores_table
    display_double_lines
    display_header
    display_scores
    display_single_lines
    display_history
    display_double_lines
  end

  def final_winner?
    if Score.max_points?(human.score, computer.score)
      puts "#{last_round_winner.name} reached 5 wins first!"
      puts "#{last_round_winner.name} gets the Trophy!"
      return true
    end

    false
  end

  def play_again?
    answer = nil
    loop do
      puts "Would you like to play again? (y/n)"
      answer = gets.chomp
      break if %w(y n).include?(answer.downcase)
      puts "Sorry, must be y or n"
    end

    answer.downcase == 'y'
  end

  def play_game
    loop do
      players.map(&:choose)
      display_moves
      display_winner
      display_scores_table
      break if final_winner?
      break unless play_again?
      clear_screen
    end
  end
end

system "clear"
RPSGame.new.start
