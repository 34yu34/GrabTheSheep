require 'app/game/core/label.rb'
require 'app/game/core/constant.rb'

class GameLabels
    def initialize(args)
        @sheep_in_label = Label.new(args)
        @timer_label = Label.new(args)
        @sheep_in_label.transform.position = Point.new(SCREEN_WIDTH / 2, SCREEN_HEIGHT - 20)
        @timer_label.transform.position = Point.new(SCREEN_WIDTH / 2, SCREEN_HEIGHT - 40)
    end

    def update(args)
        @sheep_in_label.set_text("total sheeps in : #{args.state.center_zone.sheep_in}")
        @timer_label.set_text("time left : #{args.state.timer.time_string}")
    end

    def draw(args)
        @sheep_in_label.draw(args)
        @timer_label.draw(args)
    end
end