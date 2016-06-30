class Card
  attr_accessor :value, :suit, :face


  def initialize(face,suit)
    self.suit = suit
    self.face = face
    facevalcalc
  end

  def facevalcalc
    if self.face.is_a? String
      facevalues = {"Jack" => 11, "Queen" => 12,"King" => 13,"Ace" => 14}
      self.value = facevalues[face]
    else
      self.value = face
    end
  end

end
