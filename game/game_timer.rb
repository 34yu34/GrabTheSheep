require "app/game/core/game_object.rb"
require "app/game/core/constant.rb"

class GameTimer < GameObject
    attr_reader :time_left

    def initialize(args)
        @GAME_TIME = 20 * SECOND
        @time_left = @GAME_TIME
    end

    def update(args)
        @time_left -= 1
    end

    def time_string
        return '%.2f' % (@time_left.to_f / SECOND.to_f)
    end

    def game_done?
        return @time_left <= 0
    end
end