INITIAL_MARKER = ' '
PLAYER_MARKER = 'X'
COMPUTER_MARKER = 'O'
WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] + # rows
                [[1, 4, 7], [2, 5, 8], [3, 6, 9]] + # cols
                [[1, 5, 9], [3, 5, 7]]              # diagnals
VALID_PLAYER = { '1' => 'player',
                 '2' => 'computer' }

def prompt(msg)
  puts "=> #{msg}"
end

def clean_screen
  system "clear"
end

def first_player_verified?(choice)
  /^[123]$/.match(choice)
end

def play_again_verified?(choose)
  /^[YyNn]$/.match(choose)
end

def choose_first_player
  choice = nil

  loop do
    prompt "Welcome to Tic Tac Toe"
    prompt "Please choose who plays first, this choice will last till the end."
    prompt "1. You yourself"
    prompt "2. Computer"
    prompt "3. Randomly"
    prompt "Please press 1, 2, or 3, and press Enter"
    choice = gets.chomp
    break if first_player_verified?(choice)
    prompt "Your input is not a valid choice, please choose again."
  end

  choice
end

def who_play_first(choice)
  if choice == '3'
    choice = Random.new.rand(1..2).to_s
  end
  VALID_PLAYER[choice]
end

def joinor(elements, separator = ', ', last_conj = 'or')
  case elements.size
  when 0 then ''
  when 1 then elements.first
  when 2 then "#{elements[0]} #{last_conj} #{elements[1]}"
  else
    elements[-1] = "#{last_conj} #{elements.last}"
    elements.join(separator)
  end
end

# rubocop:disable Metrics/AbcSize, Metrics/MethodLength
def display_board(brd, scores, first_player)
  clean_screen
  puts "You're a #{PLAYER_MARKER}. Computer is #{COMPUTER_MARKER}."
  puts "The first player who reaches 5 wins gets the Final Champion Trophy!"
  puts "#{first_player.capitalize} plays first."
  puts "----------------------------"
  puts "        PLAYER      COMPUTER"
  puts "Score:       #{scores[:player]}             #{scores[:computer]}"
  puts "----------------------------"
  puts ""
  puts "     |     |"
  puts "  #{brd[1]}  |  #{brd[2]}  |  #{brd[3]}"
  puts "     |     |"
  puts "-----+-----+-----"
  puts "     |     |"
  puts "  #{brd[4]}  |  #{brd[5]}  |  #{brd[6]}"
  puts "     |     |"
  puts "-----+-----+-----"
  puts "     |     |"
  puts "  #{brd[7]}  |  #{brd[8]}  |  #{brd[9]}"
  puts "     |     |"
  puts ""
end
# rubocop:enable Metrics/AbcSize, Metrics/MethodLength

def initialize_board
  new_board = {}
  (1..9).each { |num| new_board[num] = INITIAL_MARKER }
  new_board
end

def initialize_score
  { player: 0, computer: 0 }
end

def empty_squares(brd)
  brd.keys.select { |num| brd[num] == INITIAL_MARKER }
end

def player_places_piece!(brd)
  square = ''
  loop do
    prompt "Choose a square (#{joinor(empty_squares(brd), ', ')}):"
    square = gets.chomp.to_i
    break if empty_squares(brd).include?(square)
    prompt "Sorry, that's not a valid choice."
  end
  brd[square] = PLAYER_MARKER
end

# rubocop:disable Lint/AssignmentInCondition
def computer_defence(brd)
  WINNING_LINES.each do |line|
    if brd.values_at(*line).count(PLAYER_MARKER) == 2
      if empty_index = brd.values_at(*line).index(INITIAL_MARKER)
        return line[empty_index]
      else
        next
      end
    end
  end
  nil
end

def computer_offense(brd)
  WINNING_LINES.each do |line|
    if brd.values_at(*line).count(COMPUTER_MARKER) == 2
      if empty_index = brd.values_at(*line).index(INITIAL_MARKER)
        return line[empty_index]
      else
        next
      end
    end
  end
  nil
end
# rubocop:enable Lint/AssignmentInCondition

def square_5_first(brd)
  if empty_squares(brd).include?(5)
    return 5
  end
  nil
end

def computer_places_piece!(brd)
  if !square = computer_offense(brd)        # 1. offense first
    if !square = computer_defence(brd)      # 2. defence second
      if !square = square_5_first(brd)      # 3. square 5 thirdly
        square = empty_squares(brd).sample  # 4. randomly pick lastly
      end
    end
  end
  brd[square] = COMPUTER_MARKER
end

def board_full?(brd)
  empty_squares(brd).empty?
end

def someone_won?(brd)
  !!detect_winner(brd)
end

def detect_winner(brd)
  WINNING_LINES.each do |line|
    if brd.values_at(line[0], line[1], line[2]).count(PLAYER_MARKER) == 3
      return 'player'
    elsif brd.values_at(line[0], line[1], line[2]).count(COMPUTER_MARKER) == 3
      return 'computer'
    end
  end
  nil
end

def update_scores(winner, scores)
  scores[winner.to_sym] += 1
end

def five_wins?(scores)
  if scores.key(5)
    final_winner = scores.key(5).capitalize
    prompt "#{final_winner} has reached 5 wins first"
    prompt "#{final_winner} gets the Final Champion Trophy!"
    true
  end
end

def place_piece!(brd, current_player)
  if current_player == 'player'
    player_places_piece!(brd)
  else
    computer_places_piece!(brd)
  end
end

def alternate_player(current_player)
  current_player == 'player' ? 'computer' : 'player'
end

def one_round_completion(brd, scores, first_player)
  if someone_won?(brd)
    winner = detect_winner(brd)
    update_scores(winner, scores)
    display_board(brd, scores, first_player)
    prompt "#{winner.capitalize} won!"
  else
    prompt "It's a tie!"
  end
end

def play_again?
  response = nil

  loop do
    prompt("Play again? (y or n)")
    response = gets.chomp
    break if play_again_verified?(response)
    prompt('This is not an invalid input, please choose again.')
  end

  play_again = response.downcase == 'y'
  play_again
end

# game begins
scores = initialize_score
clean_screen
first_player_choice = choose_first_player

loop do
  board = initialize_board
  first_player = current_player = who_play_first(first_player_choice)

  # game playing loop for one round
  loop do
    display_board(board, scores, first_player)
    place_piece!(board, current_player)
    current_player = alternate_player(current_player)
    break if someone_won?(board) || board_full?(board)
  end

  display_board(board, scores, first_player)
  one_round_completion(board, scores, first_player)

  break if five_wins?(scores)
  break unless play_again?
end

prompt "Thanks for playing Tic Tac Toe! Good bye!"
