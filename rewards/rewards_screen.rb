require 'app/rewards/rewards_labels.rb'
require 'app/rewards/rewards_buttons.rb'

class RewardsScreen

    def initialize(args)
        args.state.rewards_label = RewardsLabels.new(args)
        args.state.rewards_button = RewardsButtons.new(args)
    end

    def update(args)
        args.state.rewards_label.update(args)
        args.state.rewards_button.update(args)
    end
    
    def draw(args)
        args.state.rewards_label.draw(args)
        args.state.rewards_button.draw(args)
    end

    def next_state(args)
        args.state.rewards_button.replay? ? :restart : :rewards
    end
end