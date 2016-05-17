require "./lib/deck"
require "./lib/card"
require "./lib/guess"
require "pry"

class Round
  attr_reader :deck,
              :guesses,
              :number_correct

  def initialize(deck)
    @deck = deck
    @guesses = []
    @number_correct = 0
  end

  def current_card
    deck.cards[@guesses.count]
  end

  def record_guess(response)
    guess = Guess.new(response, current_card)
    @guesses << guess
    if response == guess.card.answer
      @number_correct += 1
    end
    guess
  end

  def percent_correct
    (number_correct / @guesses.count.to_f) * 100
  end

end
