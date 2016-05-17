require "./lib/guess"
require "./lib/card"
require "./lib/deck"
require "./lib/round"
require "./lib/card_generator"


card_1 = Card.new("What is the capital of Alaska?", "Juneau")
card_2 = Card.new("Approximately how many miles are in one astronomical unit?", "93,000,000")
card_3 = Card.new("How hours are in a calendar year?", "8760")
card_4 = Card.new("How many planets are there in the our solar system?", "9")

deck = Deck.new([card_1, card_2, card_3, card_4])

round = Round.new(deck)

round.start
