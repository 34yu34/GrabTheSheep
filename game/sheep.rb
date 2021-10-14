require 'app/game/core/constant.rb'
require 'app/game/core/game_object.rb'
require 'app/game/core/color.rb'

class Sheep < GameObject
    attr_reader :score

    def initialize(args = nil)
        @RUN_OUT_DIST = 5 * UNIT
        @WALK_SPEED = 1 * UNIT_PER_SEC
        @RUN_SPEED = 8 * UNIT_PER_SEC
        @SHEEP_SIZE = 1/4 * UNIT
        @score = 1

        super(args)

        @color = Color.GREEN
        set_size(@SHEEP_SIZE)

        
        @RANDOM_DIR = Point.new((1-(-1)) * rand + -1, (1-(-1)) * rand + -1).normalize
        @direction = @RANDOM_DIR.angle
        @stun_timer = 0
    end

    def update(args)
        if (check_flee(args))
            return
        end

        if (check_stun())
            return
        end

        move_random()
    end

    def set_size(size)
        @transform.scale.x = size
        @transform.scale.y = size
    end

    def check_flee(args)
        dist_vect = @transform.position - args.state.player.transform.position

        if (dist_vect.mag2 > (@RUN_OUT_DIST ** 2))
            return false
        end

        @transform.position += (dist_vect / (dist_vect.mag2) * (@RUN_SPEED)) * (@RUN_OUT_DIST / 2)
        @stun_timer = 1 * SECOND
        return true
    end

    def check_stun
        @stun_timer -= 1
        return @stun_timer > 0
    end

    def move_random
        @transform.position += (@RANDOM_DIR * @WALK_SPEED)
    end

    def self.spawn_at(x, y, type=Sheep)
        sheep = type.new

        sheep.transform.position.x = x 
        sheep.transform.position.y = y

        return sheep
    end
end