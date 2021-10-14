class Point
    attr_accessor :x, :y

  def initialize(x=0, y=0)
    @x = x
    @y = y
  end

  def to_s
    return "(#{@x}, #{@y})"
  end

  def self.[](x, y)
    return Point.new(x, y)
  end

  def -(pts)
    operate(:-, pts)
  end

  def +(pts)
    operate(:+, pts)
  end

  def *(pts)
    operate(:*, pts)
  end

  def /(pts)
    operate(:/, pts)
  end

  def **(pts)
    operate(:**, pts)
  end

  def dist2(pts)
    return (self - pts).mag2
  end

  def dist(pts)
    return (self - pts).mag
  end

  def mag2
    return (@x**2) + (@y**2)
  end

  def mag
    return ((@x**2) + (@y**2)) ** 0.5
  end

  def normalize
    return Point.new(@x / mag(), @y / mag())
  end

  def angle
    return Math.atan(normalize.y / normalize.x)
  end


  def operate (op, pts)
    if pts.is_a?(Point)
        return Point.new(@x.send(op, pts.x), @y.send(op, pts.y))
    end

    return Point.new(@x.send(op, pts), @y.send(op, pts))
  end

end