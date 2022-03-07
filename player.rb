
class Player
  attr_accessor :lose_life
  attr_reader :life, :name

  def initialize(name)
      @name = name
      @life = 3
  end
  
  def lose_life
      @life -= 1
  end

end
