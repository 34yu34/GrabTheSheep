require 'app/game/sheep.rb'
require 'app/game/power_sheep.rb'
require 'app/game/core/constant.rb'

class SheepSpawner
    attr_reader :sheeps, :sheep_spawned

    SPAWN_SPEED = 6
    SPAWN_INTERVAL = 60 / SPAWN_SPEED
    SPAWN_BUFFER = 100
    POWER_SHEEP_INTERVAL = 6

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
        @sheeps.each {|s| s.draw(args) }
    end

    def update_sheeps(args)
        @sheeps.each {|s| s.update(args) }
    end

    def spawn_on_interval(args)

        if (args.state.tick_count % SPAWN_INTERVAL != 0)
            return
        end
        
        spawner = args.state.tick_count % (SPAWN_INTERVAL * POWER_SHEEP_INTERVAL) == 0 ? PowerSheep : Sheep

        @sheeps << spawner.spawn_at(
            (SCREEN_WIDTH - 2*SPAWN_BUFFER) * rand + SPAWN_BUFFER, 
            (SCREEN_HEIGHT - 2*SPAWN_BUFFER) * rand + SPAWN_BUFFER,
            spawner
        )
        @sheep_spawned += 1
    end

    def clean_up_sheep
        @sheeps.select!{|s| is_inside_screen(s.transform.position) }
    end

    def is_inside_screen(position)
        position.x >= 0 &&
        position.y >= 0 &&
        position.x <= SCREEN_WIDTH &&
        position.y <= SCREEN_HEIGHT
    end
end