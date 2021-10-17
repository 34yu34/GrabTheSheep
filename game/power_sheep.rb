class PowerSheep < Sheep
    
    def constants
        super
        @WALK_SPEED = 3 * UNIT_PER_SEC
        @RUN_SPEED = 12 * UNIT_PER_SEC
        @SHEEP_SIZE = 3 * UNIT / 4
        @STUN_TIME = 1.5 * SECOND
        @score = 3
    end
    
    def initialize(args = nil)
        super(args)

        @color = Color.YELLOW
        @sprite.path = "customs/sheep3.png"
        set_size(@SHEEP_SIZE)
    end
end