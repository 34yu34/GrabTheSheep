require 'app/rewards/rewards_labels.rb'

class RewardsScreen

    def initialize(args)
        args.state.rewards_label = RewardsLabels.new(args)
    end

    def update(args)
        args.state.rewards_label.update(args)
    end
    
    def draw(args)
        args.state.rewards_label.draw(args)
    end

    def next_state(args)
        :rewards
    end
end