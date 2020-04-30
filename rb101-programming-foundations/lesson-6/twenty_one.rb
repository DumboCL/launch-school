SUITS = ['♥', '♦', '♣', '♠']
LABELS = ['2', '3', '4', '5', '6', '7', '8',
          '9', '10', 'J', 'Q', 'K', 'A']
VALUES = { '2' => 2, '3' => 3, '4' => 4, '5' => 5, '6' => 6, '7' => 7, '8' => 8,
           '9' => 9, '10' => 10, 'J' => 10, 'Q' => 10, 'K' => 10 }
A_VALUES = { min: 1, max: 11 }

def prompt(msg)
  puts "=> #{msg}"
end

def clean_screen
  system "clear"
end

def response_veryfied?(choose)
  /^[HhSs]$/.match(choose)
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

def display_hand(hand)
  display = []
  hand.each do |card|
    display << card[:suit] + card[:label]
  end
  display.join(',')
end

def display_table(d_hand, p_hand)
  clean_screen
  prompt "Welcome to Twenty-One"
  prompt ""
  prompt "Dealer\'s Hand"
  prompt "---------------"
  prompt display_hand(d_hand)
  prompt ""
  prompt "Player\'s Hand"
  prompt "---------------"
  prompt display_hand(p_hand)
  prompt ""
end

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

def stay?(response)
  response == 'stay'
end

def min_deck_value(deck)
  deck_w_a, deck_wo_a = deck.partition { |card| card[:label] == 'A' }
  min_value = value_without_a(deck_wo_a) + deck_w_a.size
  min_value
end

def bust?(value)
  value > 21
end

def optimal?(value)
  value.between?(17, 21)
end

def include_a?(deck)
  deck_w_a, = deck.partition { |card| card[:label] == 'A' }
  deck_w_a.!empty?
end

def optimal_deck_value(deck)
  deck_w_a, = deck.partition { |card| card[:label] == 'A' }
  optimal = min_value = min_deck_value(deck)
  deck_w_a.size.times do
    optimal += 10
    if bust?(optimal)
      optimal = min_value
      break
    end
    break if optimal?(optimal)
    min_value = optimal
  end

  optimal
end

def player_turn(deck, dealer_deck, player_deck)
  loop do
    response = player_response
    break if stay?(response)
    player_deck << draw_card(deck)
    display_table(dealer_deck, player_deck)
    break if bust?(min_deck_value(player_deck))
  end
end

def dealer_turn(deck, dealer_deck, player_deck)
  loop do
    break if optimal?(optimal_deck_value(dealer_deck))
    dealer_deck << draw_card(deck)
    break if bust?(min_deck_value(dealer_deck))
  end
  display_table(dealer_deck, player_deck)
end

def display_result(message, dealer_deck, player_deck)
  dealer_value = optimal_deck_value(dealer_deck)
  player_value = optimal_deck_value(player_deck)
  if message.empty?
    message = if dealer_value > player_value
                "dealer wins"
              elsif player_value > dealer_value
                "player wins"
              else
                "it's a push"
              end
  end
  prompt message
  prompt "dealer's result: #{dealer_value}"
  prompt "player's result: #{player_value}"
end

# game start
deck = initialized_deck
dealer_deck = []
player_deck = []
dealer_deck << draw_card(deck) << draw_card(deck)
player_deck << draw_card(deck) << draw_card(deck)

display_table(dealer_deck, player_deck)
player_turn(deck, dealer_deck, player_deck)
message = ''
if bust?(min_deck_value(player_deck))
  message = 'player bust, dealer wins.'
else
  dealer_turn(deck, dealer_deck, player_deck)
  if bust?(min_deck_value(dealer_deck))
    message = 'dealer bust, player wins.'
  end
end

display_result(message, dealer_deck, player_deck)
