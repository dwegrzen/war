require './card.rb'
require './deck.rb'

class Player

  attr_accessor :deck

  def initialize
    @deck = Deck.new
  end

  def draw
    deck.cards.shift
  end
end
