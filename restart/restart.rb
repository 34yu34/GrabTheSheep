require 'app/game/game.rb'

class Restart
    
    def initialize(args)
    end

    def update(args)
        args.state.scenes[:game] = Game.new(args)
    end

    def draw(args)
    end

    def next_state(_args)
        :game
    end
end