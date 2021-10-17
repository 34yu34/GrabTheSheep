require 'app/game/core/label.rb'
require 'app/game/core/constant.rb'

class RewardsLabels
  def initialize(args)
    @score_label = Label.new(args)
    @score_label.transform.position = Point.new(SCREEN_WIDTH / 2, 3 * SCREEN_HEIGHT / 4)
    @score_label.set_size(10)

    @licenses_label = Label.new(args)
    @licenses_label.transform.position = Point.new(SCREEN_WIDTH / 2, SCREEN_HEIGHT / 4)
    @licenses_label.set_text('Background music from PlayOnLoop.com - Licensed under Creative Commons by Attribution 4.0')
  end

  def update(args)
    @score_label.set_text("TOTAL SCORE : #{args.state.center_zones.map(&:sheep_in).reduce(&:+)}")
  end

  def draw(args)
    @score_label.draw(args)
    @licenses_label.draw(args)
  end
end
