require "./test/testhelper"
require "./lib/card_generator"

class CardGeneratorTest < Minitest::Test

  def test_it_can_generate_cards
    filename = "cards.txt"
    cards = CardGenerator.new(filename).cards
    assert_equal Array, cards.class
  end
end
