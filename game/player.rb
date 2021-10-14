require 'app/game/core/game_object.rb'

class Player < GameObject

    def initialize(args)
        super(args)
    end

    def update(args)
        @transform.position.x = args.inputs.mouse.x
        @transform.position.y = args.inputs.mouse.y
    end

    def draw(args)
        args.outputs.sprites << to_h()
    end
end