require 'app/game/core/label.rb'
require 'app/game/core/game_object.rb'

class Button < Label
    attr_accessor :is_clicked

    def initialize(args)
        super(args)
        @base_color = @color
        resize()
        @is_clicked = false
    end
    
    def update(args)
        is_inside = inside?(args.inputs.mouse)
        @color = is_inside ? @base_color.darker : @base_color
        @is_clicked = is_inside && args.inputs.mouse.button_left
    end

    def color(val)
        @color
    end

    def color=(val)
        @base_color = val
    end

    def inside?(pos)
        pos.x > (@transform.position.x - @transform.scale.x / 2) && 
        pos.x < (@transform.position.x + @transform.scale.x / 2) && 

        pos.y > (@transform.position.y - @transform.scale.y / 2) && 
        pos.y < (@transform.position.y + @transform.scale.y / 2) 
    end
end