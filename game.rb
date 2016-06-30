require './card.rb'
require './deck.rb'
require './player.rb'

class Game

  attr_accessor :player1, :player2, :cardstore1, :cardstore2, :discard, :p1rounds, :p2rounds

  def initialize
    @player1 = Player.new
    @player2 = Player.new
    @cardstore1 = []
    @cardstore2 = []
    @discard = []
    @p1rounds = 0
    @p2rounds = 0
    @wars = 0
  end

  def playgame
    self.cardstore1 << player1.draw
    self.cardstore2 << player2.draw
    comparison
  end

  def comparison
    if cardstore1.last.value == cardstore2.last.value
      tie
    elsif cardstore1.last.value > cardstore2.last.value
      p1winround
    else
      p2winround
    end
  end

  def count
    puts player1.deck.cards.length
    puts player2.deck.cards.length
  end

  def newdecks
    player1.deck.cards.newdeck
    player2.deck.cards.newdeck
  end

  def tie
    self.discard << cardstore1
    self.discard << cardstore2
    # cardstore1.clear
    # cardstore2.clear
  end

  def p1winround
    self.player1.deck.cards << cardstore1
    self.player1.deck.cards << cardstore2
    # cardstore1.clear
    # cardstore2.clear
    self.p1rounds += 1
  end

  def p2winround
    self.player2.deck.cards << cardstore1
    self.player2.deck.cards << cardstore2
    # cardstore1.clear
    # cardstore2.clear
    self.p2rounds += 1
  end



end
