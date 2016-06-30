require './card.rb'
require './deck.rb'
require './player.rb'

class Game

  attr_accessor :player1, :player2, :cardstore1, :cardstore2, :discard, :p1rounds, :p2rounds, :wars, :rematch

  def initialize
    @player1 = Player.new
    @player2 = Player.new
    @cardstore1 = []
    @cardstore2 = []
    @discard = []
    @p1rounds = 0
    @p2rounds = 0
    @wars = 0
    @rematch = true
  end

  def playgame
    while self.rematch
      until player1.deck.cards.length == 0 || player1.deck.cards.length == 0
        self.cardstore1 << player1.draw
        self.cardstore2 << player2.draw
        comparison
      end
    determinewinner
    end
    puts "Thanks for playing!"
  end

  def determinewinner
    if player1.deck.cards.length == 0 && player2.deck.cards.length > 0
      player2wins
    elsif player2.deck.cards.length == 0 && player1.deck.cards.length > 0
      player1wins
    elsif player2.deck.cards.length == 0 && player1.deck.cards.length == 0
      cardrunout
    else
      puts "check your win conditions"
    end
  end

  def cardrunout
    puts "Both players ran out of cards after #{p1rounds+p2rounds} rounds and #{wars} wars. Player1 won #{p1rounds} rounds and Player2 won #{p2rounds} rounds. Would you like a rematch (y/n)?"
    response = gets.chomp&.downcase[0]
    self.rematch = response == "y" ? true : false
    reset
  end

  def player1wins
    puts "Player 1 won this game after #{p1rounds+p2rounds} rounds and survived #{wars} WARs. Would you like a rematch (y/n)?"
    response = gets.chomp&.downcase[0]
    self.rematch = response == "y" ? true : false
    reset
  end

  def player2wins
    puts "Player 2 won this game after #{p2rounds+p1rounds} rounds and survived #{wars} WARs. Would you like a rematch (y/n)?"
    response = gets.chomp&.downcase[0]
    self.rematch = response == "y" ? true : false
    reset
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

  def reset
    self.player1 = Player.new
    self.player2 = Player.new
    self.p1rounds=0
    self.p2rounds=0
    self.wars=0
  end

  def tie
    self.discard += cardstore1
    self.discard += cardstore2
    self.cardstore1.clear
    self.cardstore2.clear
    self.wars += 1
  end

  def p1winround
    # self.player1.deck.cards += cardstore1
    # self.player1.deck.cards += cardstore2
    self.cardstore1.clear
    self.cardstore2.clear
    self.p1rounds += 1
  end

  def p2winround
    # self.player2.deck.cards += cardstore1
    # self.player2.deck.cards += cardstore2
    self.cardstore1.clear
    self.cardstore2.clear
    self.p2rounds += 1
  end

  def clearbanks
    self.cardstore1.clear
    self.cardstore2.clear
    self.discard.clear
  end

end

Game.new.playgame
