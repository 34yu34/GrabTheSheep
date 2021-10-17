require 'app/game/core/label.rb'
require 'app/game/core/constant.rb'

class GameLabels
    def initialize(args)
        @sheep_in_label = Label.new(args)
        @sheep_in_label.transform.position = Point.new(SCREEN_WIDTH / 2, SCREEN_HEIGHT - 20)
        @sheep_in_label.set_size(5)

        @timer_label = Label.new(args)
        @timer_label.transform.position = Point.new(SCREEN_WIDTH / 2, SCREEN_HEIGHT - 40)
    end

    def update(args)
        @sheep_in_label.set_text("CURRENT SCORE : #{args.state.center_zones.map(&:sheep_in).reduce(&:+)}")
        @timer_label.set_text("time left : #{args.state.timer.time_string}")
    end

    def draw(args)
        @sheep_in_label.draw(args)
        @timer_label.draw(args)
    end
end