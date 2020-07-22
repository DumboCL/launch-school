SUITS = ['♥', '♦', '♣', '♠']
LABELS = ['2', '3', '4', '5', '6', '7', '8',
          '9', '10', 'J', 'Q', 'K', 'A']
VALUES = { '2' => 2, '3' => 3, '4' => 4, '5' => 5, '6' => 6, '7' => 7, '8' => 8,
           '9' => 9, '10' => 10, 'J' => 10, 'Q' => 10, 'K' => 10 }
A_VALUES = { min: 1, max: 11 }
TARGET_VALUE = 21
OPTIMAL_VALUE = 17

def prompt(msg)
  puts "=> #{msg}"
end

def clean_screen
  system "clear"
end

def response_veryfied?(choose)
  /^[HhSs]$/.match(choose)
end

def play_again_verified?(choose)
  /^[YyNn]$/.match(choose)
end

def play_again?
  response = nil

  loop do
    prompt ""
    prompt("Play again? (y or n)")
    response = gets.chomp
    break if play_again_verified?(response)
    prompt('This is not an invalid input, please choose again.')
  end

  response.downcase == 'y'
end

def initialized_deck
  deck = []
  SUITS.product(LABELS).shuffle.each do |pair|
    card = Hash.new
    card[:suit] = pair[0]
    card[:label] = pair[1]
    deck << card
  end

  deck
end

def initialize_score
  { player: 0, dealer: 0 }
end

def player_response
  response = nil
  loop do
    prompt "hit or stay? (press 'h' or 's', then press ENTER)"
    response = gets.chomp
    break if response_veryfied?(response)
    prompt('This is not an invalid input, please choose again.')
  end

  response.downcase == 'h' ? 'hit' : 'stay'
end

def stay?(response)
  response == 'stay'
end

def display_dealer_hand(hand, display_all_cards)
  display = []
  hand.each_with_index do |card, i|
    display << if i == 0 && !display_all_cards
                 "[HIDDEN]"
               else
                 card[:suit] + card[:label]
               end
  end
  display.join(',')
end

def display_player_hand(hand)
  display = []
  hand.each do |card|
    display << card[:suit] + card[:label]
  end
  display.join(',')
end

# rubocop:disable Metrics/AbcSize, Metrics/MethodLength
def display_table(scores, d_hand, p_hand, display_all_cards = false)
  clean_screen
  prompt "Welcome to Twenty-One"
  prompt "The first participant who reaches 5 wins gets"
  prompt "the Final Champion Trophy!"
  prompt "=========================="
  prompt "        DEALER      PLAYER"
  prompt "Score:       #{scores[:dealer]}           #{scores[:player]}"
  prompt "=========================="
  prompt ""
  prompt "Dealer\'s Hand"
  prompt "---------------"
  prompt display_dealer_hand(d_hand, display_all_cards)
  prompt ""
  prompt "Player\'s Hand"
  prompt "---------------"
  prompt display_player_hand(p_hand)
  prompt ""
end
# rubocop:enable Metrics/AbcSize, Metrics/MethodLength

def draw_card(deck)
  deck.shift
end

def value_without_a(deck)
  sum = 0
  deck.each do |card|
    sum += VALUES[card[:label]]
  end

  sum
end

def min_deck_value(deck)
  deck_w_a, deck_wo_a = deck.partition { |card| card[:label] == 'A' }
  value_without_a(deck_wo_a) + deck_w_a.size
end

def bust?(value)
  value > TARGET_VALUE
end

def optimal?(value)
  value.between?(OPTIMAL_VALUE, TARGET_VALUE)
end

def value_in_hand(deck)
  deck_w_a, = deck.partition { |card| card[:label] == 'A' }
  optimal = min_value = min_deck_value(deck)
  if min_value <= TARGET_VALUE
    deck_w_a.size.times do
      optimal += 10
      if bust?(optimal)
        optimal = min_value
        break
      end
      break if optimal?(optimal)
      min_value = optimal
    end
  end

  optimal
end

def player_turn(scores, deck, dealer_deck, player_deck)
  loop do
    response = player_response
    break if stay?(response)
    player_deck << draw_card(deck)
    display_table(scores, dealer_deck, player_deck)
    break if bust?(value_in_hand(player_deck))
  end
end

def dealer_turn(scores, deck, dealer_deck, player_deck)
  loop do
    break if optimal?(value_in_hand(dealer_deck))
    dealer_deck << draw_card(deck)
    display_table(scores, dealer_deck, player_deck)
    break if bust?(value_in_hand(dealer_deck))
  end
end

def display_result(message, dealer_final, player_final)
  prompt message
  prompt "dealer's result: #{dealer_final}"
  prompt "player's result: #{player_final}"
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

# game start

scores = initialize_score

loop do
  deck = initialized_deck
  dealer_deck = []
  player_deck = []
  dealer_deck << draw_card(deck) << draw_card(deck)
  player_deck << draw_card(deck) << draw_card(deck)
  display_table(scores, dealer_deck, player_deck)

  player_turn(scores, deck, dealer_deck, player_deck)
  player_final = value_in_hand(player_deck)

  message = ''
  winner = ''
  if bust?(player_final)
    message = 'player bust, dealer wins.'
    dealer_final = value_in_hand(dealer_deck)
    winner = 'dealer'
  else
    dealer_turn(scores, deck, dealer_deck, player_deck)
    dealer_final = value_in_hand(dealer_deck)
    if bust?(dealer_final)
      message = 'dealer bust, player wins.'
      winner = 'player'
    end
  end
  if message.empty?
    message = if dealer_final > player_final
                winner = 'dealer'
                "dealer wins"
              elsif player_final > dealer_final
                winner = 'player'
                "player wins"
              else
                "it's a push"
              end
  end

  update_scores(winner, scores) if !winner.empty?
  display_table(scores, dealer_deck, player_deck, true)
  display_result(message, dealer_final, player_final)

  break if five_wins?(scores)
  break unless play_again?
end

prompt "Thanks for playing. Bye Bye."
