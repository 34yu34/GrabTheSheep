require 'app/game/core/game_object.rb'
require 'app/game/core/point.rb'
require 'app/game/core/constant.rb'

class CenterZone < GameObject
    attr_reader :sheep_in

    def initialize(args)
        @RADIUS = 5 * UNIT

        super(args)

        @transform.position = Point.new(SCREEN_WIDTH / 2, SCREEN_HEIGHT / 2)
        @transform.scale = Point.new(@RADIUS * 2, @RADIUS * 2)
        @sprite.path = 'customs/center.png'

        @sheep_in = 0
    end

    def update(args)
        @sheep_in = args.state.sheeps_spawner.sheeps.
                                select{|s| s.transform.position.dist(@transform.position) < @RADIUS}.
                                inject(0){|score, s| score + s.score}
    end

    def draw(args)
        args.outputs.sprites << to_h()
    end
end