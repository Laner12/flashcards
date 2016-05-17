# require "./cards"
require "./lib/card"
require "pry"

class CardGenerator
  attr_reader :filename

  def initialize(filename)
    @filename = File.read(filename)
  end

  def cards
    card_data = @filename.split("\n")
                         .map { |line| line.split(",") }
    card_data.map { |q, a| Card.new(q, a) }
  end
end
