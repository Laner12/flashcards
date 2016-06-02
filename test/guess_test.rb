require "./test/testhelper"
require "./lib/guess"
require "./lib/card"


class GuessTest < Minitest::Test

  def setup
    @card = Card.new("What is the capital of Alaska?", "Juneau")
    @guess = Guess.new("Juneau", @card)
  end

  def card
    @card ||= Card.new("What is the capital of Alaska?", "Juneau")
  end
  
  def guess
    @guess ||= Guess.new("Juneau", card)
  end

  def test_it_can_use_instance_of_card
    assert_instance_of Card, guess.card
  end

  def test_it_can_use_instance_of_guess
    assert_instance_of Guess, guess
  end

  def test_it_can_take_in_a_response
    assert_equal "Juneau", guess.response
  end

  def test_it_can_evaluate_correct_guesses
    assert_equal true, guess.correct?
  end

  def test_returns_feedback_after_correct_response
    assert_equal "Correct!", guess.feedback
  end

  def test_it_can_evaluate_incorrect_guesses
    card = Card.new("Which planet is closest to the sun?", "Mercury")
    guess = Guess.new("Saturn", card)

    assert_equal "Saturn", guess.response
    assert_equal false, guess.correct?
  end

  def test_returns_feedback_after_incorrect_response
    card = Card.new("Which planet is closest to the sun?", "Mercury")
    guess = Guess.new("Saturn", card)

    assert_equal "Incorrect.", guess.feedback
  end
end
