require 'app/game/core/game_object.rb'
require 'app/game/core/point.rb'
require 'app/game/core/constant.rb'

class Player < GameObject

    def initialize(args)
        @BASIC_SPEED = 5 * UNIT_PER_SEC
        @BASIC_SPEED_DISTANCE = 1 * UNIT
        @DOG_BASIC_ANIM_TIME =  SECOND / 6

        super(args)
        
        @sprites = ["customs/dog1.png", "customs/dog2.png"]
        @curr_sprite = 0
        set_sprite()
        
        @transform.scale = Point.new(2 * UNIT, 2 * UNIT)
    end

    def update(args)
        move(args)

        animate(args)
    end

    def move(args)
        mouse = Point.new(args.inputs.mouse.x, args.inputs.mouse.y)
        speed = (mouse - @transform.position) / @BASIC_SPEED_DISTANCE * @BASIC_SPEED
        @transform.position += speed
        @transform.rotation = speed.rotation
    end

    def animate(args)
        unless (args.state.tick_count % @DOG_BASIC_ANIM_TIME).zero?
            return
        end
        @curr_sprite = (@curr_sprite + 1) % @sprites.size
        set_sprite()
    end

    def set_sprite
        @sprite.path = @sprites[@curr_sprite]
    end

    def draw(args)
        args.outputs.sprites << to_h()
    end
end