require 'app/game/core/constant.rb'
require 'app/game/core/game_object.rb'
require 'app/game/core/color.rb'

class Sheep < GameObject
    attr_reader :score

    def constants
        @RUN_OUT_DIST = 5 * UNIT
        @WALK_SPEED = 1 * UNIT_PER_SEC
        @RUN_SPEED = 8 * UNIT_PER_SEC
        @SHEEP_SIZE = 1 * UNIT / 2
        @STUN_TIME = 2 * SECOND
        @score = 1
    end

    def initialize(args = nil)
        constants()
        super(args)

        set_initial_values()
    end

    def set_initial_values
        @sprite.path = 'customs/sheep.png'
        @color = Color.WHITE
        set_size(@SHEEP_SIZE)
        @start_dir = Point.new(2 * rand - 1, 2 * rand - 1).normalize
        @stun_timer = 0
    end
    
    def reset_dir(dir = nil)
        @start_dir = !!dir ? dir : (Point.new(SCREEN_WIDTH / 2, SCREEN_HEIGHT / 2) - @transform.position).normalize # always toward center
        @transform.rotation = @start_dir.rotation
    end

    def update(args)
        if (check_flee(args))
            return
        end

        if (check_stun())
            return
        end

        walk()
    end

    def set_size(size)
        @transform.scale.x = size
        @transform.scale.y = size
    end

    def check_flee(args)
        unless entity_too_close?(args.state.player)
            return false
        end

        set_run_out_speed_away_from(args.state.player)
        stun()
        return true
    end

    def entity_too_close?(other)
        (@transform.position - other.transform.position).mag2 < @RUN_OUT_DIST**2
    end

    def set_run_out_speed_away_from(other)
        dist_vect = @transform.position - other.transform.position

        speed = (dist_vect / dist_vect.mag2 * @RUN_SPEED) * (@RUN_OUT_DIST / 2)
        @transform.position += speed
        @transform.rotation = speed.rotation
    end

    def stun()
        @stun_timer = @STUN_TIME
    end

    def check_stun
        @stun_timer -= 1
        return @stun_timer > 0
    end

    def walk
        @transform.position += (@start_dir * @WALK_SPEED)
        @transform.rotation = @start_dir.rotation
    end

    def self.spawn_at(x, y, type = Sheep)
        sheep = type.new

        sheep.transform.position.x = x
        sheep.transform.position.y = y

        return sheep
    end
end