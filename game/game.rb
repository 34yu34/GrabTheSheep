require 'app/game/core/game_object.rb'
require 'app/game/core/constant.rb'
require 'app/game/core/sound.rb'
require 'app/game/core/label.rb'
require "app/game/player.rb"
require 'app/game/sheep_spawner.rb'
require 'app/game/game_timer.rb'
require 'app/game/score_zone.rb'
require 'app/game/game_labels.rb'

class Game
    def initialize(args)
        args.state.player = Player.new(args)
        args.state.sheeps_spawner = SheepSpawner.new(args)
        setup_zones(args)
        args.state.labels = GameLabels.new(args)
        args.state.timer = GameTimer.new(args)
        args.state.game_sound = Sound.new(args, 'sounds/mad_chase.wav')
        args.state.game_sound.looping = true
    end

    def update(args)
        unless args.state.game_sound.is_playing
            args.state.game_sound.play(args)
        end
        args.state.labels.update(args)
        args.state.player.update(args)
        args.state.sheeps_spawner.update(args)
        args.state.center_zones.each { |z| z.update(args) }
        args.state.timer.update(args)
    end
    
    def draw(args)
        args.outputs.background_color = [86, 125, 70]
        args.state.center_zones.each { |z| z.draw(args) }
        args.state.labels.draw(args)
        args.state.player.draw(args)
        args.state.sheeps_spawner.draw(args)
    end

    def next_state(args)
        if args.state.timer.game_done?
            args.state.game_sound.pause(args)
            return :rewards
        end
        
        return :game
    end

    def setup_zones(args)
        args.state.center_zones = [
            ScoreZone.new(args, 5 * UNIT, Point.new(3 * SCREEN_WIDTH / 4, 1 * SCREEN_HEIGHT / 2)),
            ScoreZone.new(args, 2.5 * UNIT, Point.new(7 * SCREEN_WIDTH / 16, 2 * SCREEN_HEIGHT / 3)),
            ScoreZone.new(args, 4 * UNIT, Point.new(1 * SCREEN_WIDTH / 4, 1 * SCREEN_HEIGHT / 3))
        ]
    end
end