class PowerSheep < Sheep
    def initialize(args = nil)
        super(args)

        @WALK_SPEED = 3 * UNIT_PER_SEC
        @RUN_SPEED = 12 * UNIT_PER_SEC
        @SHEEP_SIZE = 1 * UNIT / 2
        @score = 3

        @color = Color.YELLOW
        @sprite.path = "customs/square3.png"
        set_size(@SHEEP_SIZE)
    end
end