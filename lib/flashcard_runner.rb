require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'



card1 = Card.new("What is 5 + 5", '10', :Math)
card2 = Card.new("What is the capital of Colorado?", "Denver", :Geography)
card3 = Card.new("What is 42 / 7", '6', :Math)
card4 = Card.new("Who was the first governor of Wyoming?", "John Campbell", :History)
deck = Deck.new([card1, card2, card3, card4])
round = Round.new(deck)

def start(round_parameter)
  puts "Welcome! You're playing with #{round_parameter.deck.count} cards"
  puts "-" * 50
  round_parameter.deck.cards.each do |card|
    count = 1
    puts "This is card number #{count} out of #{round_parameter.deck.count}"
    puts "Question: #{card.question}"
    puts "What is your guess"
    input = gets.chomp

    turn = round_parameter.take_turn(input)
    puts turn.feedback
    count += 1
  end
  puts "********* GAME OVER *********"
  puts "You had #{round_parameter.number_correct} out of #{round_parameter.deck.count} for total score of #{round_parameter.percent_correct}%"
end

start(round)
