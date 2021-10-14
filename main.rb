require "app/game/core/constant.rb"
require 'app/game/game.rb'
require 'app/rewards/rewards_screen.rb'
require 'app/menu/menu.rb'

def tick(args)
  
  args.outputs.background_color = [0, 0, 0]

  args.state.scene_state ||= :menu

  args.state.scenes ||= {
    menu: Menu.new(args),
    game: Game.new(args),
    rewards: RewardsScreen.new(args)
  }

  args.state.scenes[args.state.scene_state].update(args)
  args.state.scenes[args.state.scene_state].draw(args)
  args.state.scene_state = args.state.scenes[args.state.scene_state].next_state(args)

end
