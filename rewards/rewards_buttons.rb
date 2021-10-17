require 'app/game/core/button.rb'
require 'app/game/core/point.rb'
require 'app/game/core/color.rb'

class RewardsButtons

    def initialize(args)
        @restart_button = Button.new(args)
        @restart_button.set_text('restart')
        @restart_button.set_size(25)
        @restart_button.color = Color.GREEN
        @restart_button.transform.position = Point.new(SCREEN_WIDTH / 2, (SCREEN_HEIGHT / 2))
    end

    def update(args)
        @restart_button.update(args)
    end

    def draw(args)
        @restart_button.draw(args)
    end

    def replay?
        @restart_button.is_clicked
    end
end