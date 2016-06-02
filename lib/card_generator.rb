require "./lib/card"

class CardGenerator
  attr_reader :filename

  def initialize(filename)
    @filename = File.read(filename)
  end

  # def cards
  #   # can use this with readlines above vs read
  #   card_data = filename.map { |line| line.split(",")}
  #                       .map { |question, answer| Card.new(question, answer)}
  # end

  def cards
    card_data = @filename.split("\n").shuffle
                         .map { |line| line.split(",") }
    card_data.map { |question, answer| Card.new(question, answer) }
  end
end
