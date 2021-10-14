require 'app/game/core/transform.rb'
require 'app/game/core/color.rb'
require 'app/game/core/sprite.rb'

class GameObject
    attr_accessor :transform, :sprite, :color

    def initialize(args)
        @transform = Transform.new
        @color = Color.WHITE
        @sprite = Sprite.new
    end

    def update(args)
    end

    def draw(args)
        args.outputs.sprites << to_h()
    end

    def to_h
        @transform.to_h.merge(@color.to_h).merge(@sprite.to_h)
    end
end