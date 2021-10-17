require 'app/game/core/constant.rb'
require 'app/game/core/point.rb'

class Transform
    attr_accessor :position, :rotation, :scale

    def initialize(pos = Point[0, 0], rot = 0, scale = Point[UNIT, UNIT])
        @position = pos
        @rotation = rot
        @scale = scale
    end

    def to_s
        return "[pos:#{@position}, rot:#{@rotation}, scale:#{@scale}"
    end

    def to_h
        {
            x: @position.x - @scale.x / 2, 
            y: @position.y - @scale.y / 2,
            w: @scale.x,
            h: @scale.y,
            angle: @rotation
        } 
    end
end