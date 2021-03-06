module Tennis
  class Game
    attr_accessor :player1, :player2

    def initialize
      @player1 = Player.new
      @player2 = Player.new

      @player1.opponent = @player2
      @player2.opponent = @player1
    end

    # Records a win for a ball in a game.
    #
    # winner - The Integer (1 or 2) representing the winning player.
    #
    # Returns the score of the winning player. 
    def wins_ball(winner)
      # TODO: Think it's gross to pass an integer instead of a player object?
      # Then reimplement this method!
      winner.record_won_ball!
    end
  end

  class Player
    attr_accessor :points, :opponent

    def initialize
      @points = 0
    end

    # Increments the score by 1.
    #
    # Returns the integer new score.
    def record_won_ball!
      @points += 1
    end

    # Returns the String score for the player.
    def score
      return 'duce' if duce?
      return 'advantage' if advantage?
      return 'win' if win?
      return 'love' if love?
      return 'fifteen' if fifteen?
      return 'thirty' if thirty?
      return 'forty' if forty?
    end

    private

    def duce?
      @points == 3 &&  @opponent.points == 3
    end

    def advantage?
      @points >= 4 && @opponent.points + 1 == @points
    end

    def win?
      @points >= 4 && @opponent.points + 2 == @points
    end

    def love?
      @points == 0
    end

    def fifteen?
      @points == 1
    end

    def thirty?
      @points == 2
    end

    def forty?
      @points == 3
    end
  end
end