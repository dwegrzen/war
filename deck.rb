require './card.rb'


class Deck
  attr_accessor :cards

  FACES = [2,3,4,5,6,7,8,9,10,"Jack","King","Queen","Ace"]

  SUITS = ["Heart", "Diamond", "Spade", "Club"]

  def initialize
    @cards = FACES.map{|face| SUITS.map{|suit| Card.new(face,suit)}}.flatten.shuffle
  end

  def howmanyleft?
    self.deck.length
  end

  def newdeck
    @cards = FACES.map{|face| SUITS.map{|suit| Card.new(face,suit)}}.flatten.shuffle
  end

  def shuffledeck
    @cards.shuffle!
  end

end
