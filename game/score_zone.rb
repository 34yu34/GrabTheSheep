require 'app/game/core/game_object.rb'
require 'app/game/core/point.rb'
require 'app/game/core/constant.rb'

class ScoreZone < GameObject
    attr_reader :sheep_in

    def initialize(args, radius = 5 * UNIT, position = Point.new(SCREEN_WIDTH / 2, SCREEN_HEIGHT / 2))
        super(args)
        
        @radius = radius
        @transform.position = position
        @transform.scale = Point.new(@radius * 2, @radius * 2)
        @sprite.path = 'customs/score_zone_full.png'

        @sheep_in = 0
    end

    def update(args)
        @sheep_in = args.state.sheeps_spawner.sheeps
                        .select { |s| s.transform.position.dist(@transform.position) < @radius }
                        .inject(0) { |score, s| score + s.score }
    end

    def draw(args)
        args.outputs.sprites << to_h
    end

    def get_random_point_inside
        angle = 2 * Math::PI * rand
        pt = Point.new(@radius * rand * Math.cos(angle), @radius * rand * Math.sin(angle))
        (pt + @transform.position)
    end
end