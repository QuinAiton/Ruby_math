require './player.rb'
require './question.rb'


class Game
  attr_accessor :score, :p1 , :p2 , :question

  def initialize(p1, p2)
  @p1 = p1
  @p2 = p2
  @current_player = p1;
  end

  def new_turn()
    puts '---------- New Turn -----------'
  end

  def game_over
    puts '-----------Game Over------------'
    puts"#{@current_player.name} Wins with a score of #{@current_player.lives}/3"
  end

  def turn () 
    if @current_player == p1
      @current_player = p2
    else 
      @current_player = p1
    end
  end

  def score()
    puts "#{p1.name}: #{p1.lives}/3 vs #{p2.name}: #{p2.lives}/3"
  end

  def round()
    while @p1.lives > 0 && @p2.lives > 0
      question = Question.new(rand(1..20), rand(1..20))
      puts new_turn
      puts "#{@current_player.name} #{question.question}"
      answer = gets.chomp.to_i
      if answer === question.answer 
        puts "Yes! you are correct"
        score
        turn
      else 
        puts "Sorry, that is incorrect"
        @current_player.lose;
        score
        turn
      end
    end
    puts game_over
  end       
end
