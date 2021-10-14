require 'app/game/core/game_object.rb'


class Label < GameObject
    attr_reader :size, :text

    def initialize(args, in_text = "")
        super(args)
        @alignement = 0 # left aligned
        @size = 0 # default size
        @args = args
        set_text(in_text)
    end

    def set_size(size)
        @size = size
        resize()
    end

    def set_text(val)
        @text = val
        resize()
    end

    def resize()
        @transform.scale.x, @transform.scale.y = @args.gtk.calcstringbox( @text, @size, "font.ttf")
    end

    def update(args)
    end

    def draw(args)
        args.outputs.labels << to_h()
    end

    def to_h
        hash = super.merge({text: @text, size_enum: @size, alignement_enum: @alignement})
        hash[:y] = @transform.position.y + @transform.scale.y / 2

        hash
    end
end