require 'app/game/sheep.rb'
require 'app/game/power_sheep.rb'
require 'app/game/core/constant.rb'

class SheepSpawner
    attr_reader :sheeps, :sheep_spawned

    SPAWN_SPEED = 10
    SPAWN_INTERVAL = 60 / SPAWN_SPEED
    SPAWN_BUFFER = 150
    POWER_SHEEP_INTERVAL = 6

    LOC = %I[top bot right left].freeze

    def initialize(args)
        @sheeps = []
        @sheep_spawned = 0
    end

    def update(args)

        update_sheeps(args)

        spawn_on_interval(args)

        clean_up_sheep()
    end

    def draw(args)
        @sheeps.each { |s| s.draw(args) }
    end

    def update_sheeps(args)
        @sheeps.each { |s| s.update(args) }
    end

    def spawn_on_interval(args)

        unless can_spawn(args)
            return
        end

        spawner = (args.state.tick_count % (SPAWN_INTERVAL * POWER_SHEEP_INTERVAL)).zero? ? PowerSheep : Sheep
        spawn_pt = args.state.center_zones.sample.get_random_point_inside

        @sheeps << spawner.spawn_at(spawn_pt.x, spawn_pt.y, spawner)
        @sheep_spawned += 1
    end

    def can_spawn(args)
        (args.state.tick_count % SPAWN_INTERVAL).zero? && args.state.timer.time_left > 2 * SECOND
    end

    def clean_up_sheep
        @sheeps.select! { |s| is_inside_screen(s.transform.position) }
    end

    def is_inside_screen(position)
        position.x >= 0 &&
        position.y >= 0 &&
        position.x <= SCREEN_WIDTH &&
        position.y <= SCREEN_HEIGHT
    end
end