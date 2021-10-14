require 'app/game/core/game_object.rb'
require 'app/game/core/label.rb'
require "app/game/player.rb"
require 'app/game/sheep_spawner.rb'
require 'app/game/game_timer.rb'
require "app/game/center_zone.rb"
require 'app/game/game_labels.rb'

class Game
    attr_accessor :is_started    

    def initialize(args)
        args.state.player = Player.new(args)
        args.state.sheeps_spawner = SheepSpawner.new(args)
        args.state.center_zone = CenterZone.new(args)
        args.state.labels = GameLabels.new(args)
        args.state.timer = GameTimer.new(args)
    end
    
    def update(args)
        args.state.labels.update(args)
        args.state.player.update(args)
        args.state.sheeps_spawner.update(args)
        args.state.center_zone.update(args)
        args.state.timer.update(args)
        
    end

    def draw(args)
        args.state.labels.draw(args)
        args.state.player.draw(args)
        args.state.sheeps_spawner.draw(args)
        args.state.center_zone.draw(args)
    end

    def next_state(args)
        args.state.timer.game_done? ? :rewards : :game
    end
end