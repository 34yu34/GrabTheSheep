class Color
    attr_accessor :r, :g, :b, :a

    def initialize(r = 255, g = 255, b = 255, a = 255)
        @r = r
        @g = g
        @b = b
        @a = a
    end

    def lighter
        return Color.new(@r + 100, @g + 100, @b + 100, @a)
    end

    def darker
        return Color.new(@r - 100, @g - 100, @b - 100, @a)
    end

    def self.WHITE
        return Color.new
    end

    def self.GREEN
        return Color.new(0, 255, 0, 255)
    end 

    def self.RED
        return Color.new(255, 0, 0, 255)
    end

    def self.BLUE
        return Color.new(0, 0, 255, 255)
    end

    def self.YELLOW
        return Color.new(255, 255, 0, 255)
    end

    def to_h
        {
            r: @r,
            g: @g, 
            b: @b,
            a: @a
        }
    end
end