require "./lib/card"
require "pry"

class CardGenerator
  attr_reader :filename

  def initialize(filename)
    @filename = File.read(filename)
  end

  def cards
    card_data = @filename.split("\n").shuffle
                         .map { |line| line.split(",") }
    card_data.map { |question, answer| Card.new(question, answer) }
  end
end
