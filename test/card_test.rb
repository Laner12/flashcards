require "minitest/autorun"
require "minitest/pride"
require "./lib/card"

class CardsTest < Minitest::Test

  def test_creating_a_card
    card = Card.new("What is the capital of Alaska?", "Juneau")

    assert_instance_of Card, card
  end

  def test_card_has_a_question
    card = Card.new("What is the capital of Alaska?", "Juneau")

    assert_equal "What is the capital of Alaska?", card.question
  end

  def test_card_has_an_answer
    card = Card.new("What is the capital of Alaska?", "Juneau")

    assert_equal "Juneau", card.answer
  end

end
