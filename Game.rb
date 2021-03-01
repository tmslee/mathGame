require "./Player.rb"

class Game
  attr_reader :p1, :p2
  attr_accessor :current_answerer, :current_ans, :current_asker
  CORRECT_MSG = "BIG BRAIN! good job."
  INCORRECT_MSG = "SMALL BRAIN! WRONG!"

  def initialize (p1, p2)
    flip = rand() > 0.5

    @p1 = p1
    @p2 = p2
    @current_asker = flip ? p1 : p2
    @current_answerer = flip ? p2 : p1
    @current_ans = nil
  end

  def question_prompt()
    num1 = rand(1..20)
    num2 = rand(1..20)
    self.current_ans = (num1 + num2)
    prompt =  "#{self.current_asker.name}: What does #{num1} plus #{num2} equal?"
  end

  def result_msg(ans)
    msg = "#{self.current_asker.name}: "
    if check_ans(ans)
      msg += CORRECT_MSG
    else
      self.current_answerer.loseLife()
      msg += INCORRECT_MSG
    end
  end

  def check_ans(ans) 
    ans.to_i == self.current_ans
  end
  
  def swap_turn()
    self.current_answerer = self.current_answerer == self.p1 ? self.p2 : self.p1 
    self.current_asker = self.current_asker == self.p1 ? self.p2 : self.p1 
  end

end