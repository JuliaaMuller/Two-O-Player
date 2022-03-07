require "./player"

class Game

  def initialize
    @player1 = Player.new "Player 1"
    @player2 = Player.new "Player 2"
    @players = [@player1, @player2]
    @current_turn = 1
    @current_player = nil
    puts "------ WELCOME ᕙ(`▿´)ᕗ ------\n\n"
  end

  def start
    if @players.find{|player| player.life == 0}
      winner = @players.find{|player| player.life!=0}
      puts "#{winner.name} wins with a score of #{winner.life}/3"
      puts "------- GAME OVER -------"
      puts "Good bye!"

    elsif    
        if @current_turn % 2 == 1
          @current_player = @players[0]
        else
          @current_player = @players[1]
        end
        
        nb1 =  rand(1..20)
        nb2 =  rand(1..20)
        result = nb1 + nb2
        puts "------ NEW TURN ------"
        puts "#{@current_player.name} - What does #{nb1} plus #{nb2}?"
        print "your answer: "
        answer = $stdin.gets.chomp.to_i

        if  result == answer
            puts "Yeah you got it!"
            puts "(>‿◠)✌"
            puts "#{@player1.name}: #{@player1.life}/3 vs #{@player2.name}: #{@player2.life}/3"
            @current_turn +=1
            self.start
          
        else
            puts "Oops! Try again!"
            puts "( ˘︹˘ )"
            @current_player.lose_life
            puts "#{@player1.name}: #{@player1.life}/3 vs #{@player2.name}: #{@player2.life}/3"
            @current_turn +=1
            self.start 
        end
    end
  end
end




