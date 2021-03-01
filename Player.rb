class Player
  attr_reader :name
  attr_accessor :lives

  def initialize (name, lives)
    @name = name
    @lives = lives
  end

  def loseLife ()
    self.lives -= 1;
  end
end