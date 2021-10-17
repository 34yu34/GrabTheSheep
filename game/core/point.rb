class Point
  attr_accessor :x, :y

  def initialize(x = 0, y = 0)
    @x = x
    @y = y
  end

  def to_s
    "(#{@x}, #{@y})"
  end

  def self.[](x, y)
    Point.new(x, y)
  end

  def -(other)
    operate(:-, other)
  end

  def +(other)
    operate(:+, other)
  end

  def *(other)
    operate(:*, other)
  end

  def /(other)
    operate(:/, other)
  end

  def **(other)
    operate(:**, other)
  end

  def dist2(pts)
    (self - pts).mag2
  end

  def dist(pts)
    (self - pts).mag
  end

  def mag2
    (@x**2) + (@y**2)
  end

  def mag
    ((@x**2) + (@y**2))**0.5
  end

  def normalize
    Point.new(@x / mag, @y / mag)
  end

  def rotation
    dir = normalize
    degrees = 180 * Math.atan(dir.y / dir.x) / Math::PI
    degrees += dir.x.negative? ? 180 : 0
    (360 + degrees) % 360
  end

  def operate(op, pts)
    return Point.new(@x.send(op, pts.x), @y.send(op, pts.y)) if pts.is_a?(Point)

    Point.new(@x.send(op, pts), @y.send(op, pts))
  end
end
