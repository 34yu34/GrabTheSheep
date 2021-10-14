require 'app/game/core/label.rb'
require 'app/game/core/constant.rb'

class RewardsLabels

    def initialize(args)
        @score_label = Label.new(args)

        @score_label.transform.position = Point.new(SCREEN_WIDTH / 2, SCREEN_HEIGHT / 2)
        @score_label.set_size(10)
    end

    def update(args)
        @score_label.set_text("TOTAL SCORE : #{args.state.center_zone.sheep_in}")
    end

    def draw(args)
        @score_label.draw(args)
    end
end