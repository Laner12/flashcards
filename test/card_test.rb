require "./test/testhelper"
require "./lib/card"

class CardsTest < Minitest::Test

  def setup
    @card = Card.new("What is the capital of Alaska?", "Juneau")
  end

  def test_creating_a_card
    assert_instance_of Card, @card
  end

  def test_card_has_a_question
    assert_equal "What is the capital of Alaska?", @card.question
  end

  def test_card_has_an_answer
    assert_equal "Juneau", @card.answer
  end
end
