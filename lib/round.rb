require "./lib/deck"
require "./lib/card"
require "./lib/guess"

class Round
  attr_reader :deck,
              :guesses

  def initialize(deck)
    @deck = deck
    @guesses = []
  end

  def current_card
    deck.cards[0]
  end

  def record_guess(response)
    @guesses << Guess.new(response, current_card)
    @guesses.last
  end

  def number_correct
    1
  end

  def percent_correct
    guesses.count / number_correct
  end

end
