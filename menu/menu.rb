require 'app/game/core/button.rb'
require 'app/game/core/label.rb'
require 'app/game/core/color.rb'
require 'app/game/core/point.rb'
require 'app/game/core/constant.rb'

class Menu

    def initialize(args)
        initialize_start_button(args)
        initialize_title(args)
    end

    def initialize_start_button(args)
        @start_button = Button.new(args)
        @start_button.set_text('Start')
        @start_button.set_size(20)
        @start_button.color = Color.new(0, 255, 0)
        @start_button.transform.position = Point.new(SCREEN_WIDTH / 2, SCREEN_HEIGHT / 2 - 40)
    end

    def initialize_title(args)
        @title = Label.new(args)
        @title.set_text('Grab the Sheeps!')
        @title.set_size(40)
        @title.transform.position = Point.new(SCREEN_WIDTH / 2, SCREEN_HEIGHT / 2 + 120)
    end

    def update(args)
        @start_button.update(args)
        @title.update(args)
    end

    def draw(args)
        @start_button.draw(args)
        @title.draw(args)
    end

    def next_state(args)
        @start_button.is_clicked ? :game : :menu
    end
end