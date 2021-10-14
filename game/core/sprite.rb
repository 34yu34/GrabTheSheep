class Sprite
    attr_reader :path

    def initialize(in_path = 'customs/square.png')
        set_path(in_path)
    end

    def path=(val)
        set_path(val)
    end

    def set_path(path)
        @path = "sprites/#{path}"
    end

    def to_h
        {
            path: @path
        }
    end
end