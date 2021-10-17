class Sound
  attr_accessor :looping

  attr_reader :file_name, :paused, :is_playing, :volume

  def initialize(_args, in_file_name = 'sounds/mad_chase.wav')
    self.file_name = in_file_name

    @looping = false
    @paused = false
    @is_playing = false
    @volume = 0.5
  end

  def file_name=(val)
    @file_name = val

    @sym_name = val.to_sym
  end

  def play(args)
    @paused = false

    args.audio[@sym_name] = to_h

    @is_playing = true
  end

  def pause(args)
    return unless args.audio[@sym_name]

    args.audio[@sym_name].paused = true

    @paused = true

    @is_playing = false
  end

  def to_h
    {
      input: @file_name,
      x: 0.0,
      y: 0.0,
      z: 0.0,
      gain: @volume,
      pitch: 1.0,
      paused: @paused,
      looping: @looping
    }
  end
end
