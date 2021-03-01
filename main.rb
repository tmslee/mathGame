require "./Game.rb"
require "./Player.rb"

puts "Player 1 enter your name: "
p1_name = gets.chomp

puts "Player 2 enter your name: "
p2_name = gets.chomp

p1 = Player.new(p1_name, 3)
p2 = Player.new(p2_name, 3)

game = Game.new(p1, p2)

while(p1.lives > 0 && p2.lives > 0) do
  puts "==== NEW TURN ===="
  puts game.question_prompt()
  ans = gets.chomp
  puts game.result_msg(ans)
  puts "#{p1.name} : #{p1.lives} live(s) left"
  puts "#{p2.name} : #{p2.lives} live(s) left"
  game.swap_turn()
end

winner_name = p1.lives > 0 ? p1.name : p2.name
winner_score =  p1.lives > 0 ? p1.lives : p2.lives

puts "==== GAME OVER ===="
puts "#{winner_name} wins with #{winner_score} live(s) left!"
puts "bye bye bye"