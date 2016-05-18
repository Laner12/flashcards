require "./test/testhelper"
require "./lib/deck"
require "./lib/card"
require "./lib/round"
require "./lib/guess"

class RoundTest < Minitest::Test

  def setup
    @card_1 = Card.new("What is the capital of Alaska?", "Juneau")
    @card_2 = Card.new("Approximately how many miles are in one astronomical unit?", "93,000,000")
    @deck = Deck.new([@card_1, @card_2])
    @round = Round.new(@deck)
  end

  def test_it_can_instantiate_round
    assert_instance_of Deck, @round.deck
  end

  def test_it_stores_guesses
    assert_equal [], @round.guesses
  end

  def test_it_returns_current_card
    assert_instance_of Card, @round.current_card
  end

  def test_recording_guesses_and_incrementing_if_correect
    assert_instance_of Guess, @round.record_guess("Juneau")
    assert_equal 1, @round.guesses.count
    assert_equal "Correct!", @round.guesses.first.feedback
    assert_equal 1, @round.number_correct

    assert_instance_of Guess, @round.record_guess("2")
    assert_equal 2, @round.guesses.count
    assert_equal "Incorrect.", @round.guesses.last.feedback
    assert_equal "50%", @round.percent_correct
  end

  def test_the_percent_correct_returns_value
    assert_instance_of Guess, @round.record_guess("Juneau")
    assert_instance_of Guess, @round.record_guess("2")
    assert_equal "50%", @round.percent_correct
  end

  def test_the_percent_correct_is_dynamic
    assert_instance_of Guess, @round.record_guess("Juneau")
    assert_instance_of Guess, @round.record_guess("93,000,000")
    assert_equal "100%", @round.percent_correct
  end
end
