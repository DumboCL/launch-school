class Board
  WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9], # rows
    [1, 4, 7], [2, 5, 8], [3, 6, 9], # cols
    [1, 5, 9], [3, 5, 7]] # diagonals

  def initialize
    @squares = {}
    reset
  end

  # rubocop:disable Metrics/AbcSize
  # rubocop:disable Metrics/MethodLength
  def draw
    puts "     |     |"
    puts "  #{@squares[1]}  |  #{@squares[2]}  |  #{@squares[3]}"
    puts "     |     |"
    puts "-----+-----+-----"
    puts "     |     |"
    puts "  #{@squares[4]}  |  #{@squares[5]}  |  #{@squares[6]}"
    puts "     |     |"
    puts "-----+-----+-----"
    puts "     |     |"
    puts "  #{@squares[7]}  |  #{@squares[8]}  |  #{@squares[9]}"
    puts "     |     |"
  end

  # rubocop:enable Metrics/AbcSize
  # rubocop:enable Metrics/MethodLength

  def []=(key, marker)
    @squares[key].marker = marker
  end

  def unmarked_keys
    @squares.select { |_, sq| sq.unmarked? }.keys
  end

  def full?
    unmarked_keys.empty?
  end

  def someone_won?
    !!winning_marker
  end

  # return winning marker or nil
  def winning_marker
    WINNING_LINES.each do |line|
      squares = @squares.values_at(*line)
      if three_identical_markers?(squares) # => we wish this method existed
        return squares.first.marker # => return the marker, whatever it is
      end
    end
    nil
  end

  def offense_move(marker)
    WINNING_LINES.each do |line|
      if count_marker_at(line, marker) == 2
        return line.find { |pos| @squares[pos].marker != marker && @squares[pos].unmarked? }
      end
    end
    nil
  end

  def defence_move(opponent_marker)
    WINNING_LINES.each do |line|
      if count_marker_at(line, opponent_marker) == 2
        return line.find { |pos| @squares[pos].marker != opponent_marker && @squares[pos].unmarked? }
      end
    end
    nil
  end

  def square_5_first
    if unmarked_keys.include?(5)
      return 5
    end
    nil
  end

  def reset
    (1..9).each { |key| @squares[key] = Square.new }
  end

  private

  def count_marker_at(line, marker)
    line.count { |pos| @squares[pos].marker == marker }
  end

  def three_identical_markers?(squares)
    markers = squares.select(&:marked?).collect(&:marker)
    return false if markers.size != 3
    markers.min == markers.max
  end
end

class Square
  INITIAL_MARKER = " "
  attr_accessor :marker

  def initialize(marker = INITIAL_MARKER)
    @marker = marker
  end

  def unmarked?
    marker == INITIAL_MARKER
  end

  def marked?
    !unmarked?
  end

  def to_s
    @marker
  end
end

class Player
  attr_reader :marker
  attr_accessor :score

  def initialize(marker)
    @marker = marker
    @score = 0
  end
end

class TTTGame
  HUMAN_MARKER = "X"
  COMPUTER_MARKER = "O"
  MAX_WIN = 5

  def initialize
    @board = Board.new
    @human = Player.new(HUMAN_MARKER)
    @computer = Player.new(COMPUTER_MARKER)
  end

  def play
    clean_screen
    display_welcome_message
    determine_first_player
    main_game
    display_final_result
    display_goodbye_message
  end

  private

  def determine_first_player
    @first_to_move = case choose_first_player
                      when "1"
                        HUMAN_MARKER
                      when "2"
                        COMPUTER_MARKER
                      else
                        [HUMAN_MARKER, COMPUTER_MARKER].sample
    end
    @current_marker = @first_to_move
  end

  def choose_first_player
    choice = nil
    loop do
      puts "You have this one time chance to choose who is the first to play"
      puts "Press 1) Human  2) Computer  3) Randomly Pick : "
      choice = gets.chomp
      break if choice.match?(/^[123]$/)
      puts "This is not a valid choice, please choose again."
    end

    choice
  end

  attr_reader :board, :human, :computer

  def main_game
    loop do
      display_board
      player_move
      determine_winner
      display_result
      display_scores
      break if reach_max_win?
      break unless play_again?
      reset
      display_play_again_message
    end
  end

  def display_final_result
    if reach_max_win?
      final_winner = last_winner.eql?(human) ? "Human" : "Computer"
      puts "Congrats, #{final_winner} is the first to reach 5 wins."
    end
  end

  def reach_max_win?
    if last_winner == :tie
      false
    else
      last_winner.score >= MAX_WIN
    end
  end

  def player_move
    loop do
      current_player_moves
      break if board.someone_won? || board.full?
      clear_screen_and_display_board if human_turn?
    end
  end

  def display_welcome_message
    puts "Welcome to Tic Tac Toe!"
    puts "First 5 wins win the game!"
    puts ""
  end

  def display_goodbye_message
    puts "Thanks for playing Tic Tac Toe! Goodbye!"
  end

  def display_board
    puts "You're a #{human.marker}. Computer is a #{computer.marker}."
    puts ""
    board.draw
    puts ""
  end

  def display_scores
    puts "Scores Board "
    puts "============"
    puts "Human      #{human.score}"
    puts "Computer   #{computer.score}"
    puts ""
  end

  def clear_screen_and_display_board
    clean_screen
    display_board
  end

  def current_player_moves
    if human_turn?
      human_moves
      @current_marker = COMPUTER_MARKER
    else
      computer_moves
      @current_marker = HUMAN_MARKER
    end
  end

  def human_turn?
    @current_marker == HUMAN_MARKER
  end

  def human_moves
    puts "Choose a square between #{available_squares}: "
    pos_choice = nil
    loop do
      pos_choice = gets.chomp.to_i
      break if board.unmarked_keys.include?(pos_choice)
      puts "Sorry, that's not a valid choice."
    end
    board[pos_choice] = human.marker
  end

  def available_squares(delimiter = ",", word = "or")
    avail = board.unmarked_keys
    case avail.size
    when 1
      avail.first
    when 2
      avail.join(" #{word} ")
    else
      avail[-1] = "#{word} #{avail[-1]}"
      avail.join("#{delimiter} ")
    end
  end

  def computer_moves
    choice = board.offense_move(computer.marker)
    choice ||= board.defence_move(human.marker)
    choice ||= board.square_5_first
    choice ||= board.unmarked_keys.to_a.sample

    board[choice] = computer.marker
  end

  def update_score
    case last_winner
    when human
      human.score += 1
    when computer
      computer.score += 1
    end
  end

  def determine_winner
    self.last_winner = case board.winning_marker
                       when human.marker
                         human
                       when computer.marker
                         computer
                       else
                         :tie
    end
    update_score
  end

  def display_result
    clear_screen_and_display_board

    case last_winner
    when human
      puts "You won!"
    when computer
      puts "Computer won!"
    else
      puts "It's a tie!"
    end
  end

  def play_again?
    answer = nil

    loop do
      puts "Would you like to play again? (y/n)"
      answer = gets.chomp.downcase
      break if %w[y n].include?(answer)
      puts "Sorry, must be y or n"
    end

    answer == "y"
  end

  def reset
    board.reset
    @current_marker = @first_to_move
    clean_screen
  end

  def display_play_again_message
    puts "Let's play again!"
    puts ""
  end

  def clean_screen
    system "clear"
  end

  protected

  attr_accessor :last_winner
end

game = TTTGame.new
game.play
