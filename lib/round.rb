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
    percent = (number_correct / @guesses.count.to_f) * 100
    "#{percent.to_i}%"
  end

  def start
    puts "Welcome! You're playing with 4 cards."
    puts "-------------------------------------------------"
    while current_card != nil
      puts "This is card number #{@guesses.count + 1} out of #{deck.count}."
      puts current_card.question
      repl_response = gets.chomp
      guess = record_guess(repl_response)
      puts guess.feedback
    end
    puts "****** Game over! ******"
    puts "You had #{@number_correct} correct guesses out of #{deck.count} for a score of #{percent_correct}."
  end

end
