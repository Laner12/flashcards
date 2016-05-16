require "minitest/autorun"
require "minitest/pride"
require "./lib/guess"
require "./lib/card"


class GuessTest < Minitest::Test

  def test_it_can_use_instance_of_card
    card = Card.new("What is the capital of Alaska?", "Juneau")
    guess = Guess.new("Juneau", card)

    assert_instance_of Card, guess.card
    assert_instance_of Guess, guess
  end

  def test_it_can_take_in_a_response
    card = Card.new("What is the capital of Alaska?", "Juneau")
    guess = Guess.new("Juneau", card)
    guess.card

    assert_equal "Juneau", guess.response
  end

  def test_it_can_evaluate_correct_guesses
    card = Card.new("What is the capital of Alaska?", "Juneau")
    guess = Guess.new("Juneau", card)
    guess.card

    assert_equal true, guess.correct?
  end

  def test_it_can_evaluate_incorrect_guesses
    card = Card.new("Which planet is closest to the sun?", "Mercury")
    guess = Guess.new("Saturn", card)

    assert_equal "Saturn", guess.response

    assert_equal false, guess.correct?
  end

  def test_returns_feedback_after_correct_response
    card = Card.new("What is the capital of Alaska?", "Juneau")
    guess = Guess.new("Juneau", card)
    guess.card

    assert_equal "Correct!", guess.feedback
  end

  def test_returns_feedback_after_incorrect_response
    card = Card.new("Which planet is closest to the sun?", "Mercury")
    guess = Guess.new("Saturn", card)

    assert_equal "Incorrect", guess.feedback
  end
end
