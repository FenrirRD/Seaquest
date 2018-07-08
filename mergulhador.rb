class Mergulhador
  attr_accessor :x, :y, :l

  def initialize(x:, y:, l:)
    @x = x
    @y = y
    @l = l
  end

  def draw
    if(l==0)
      mergulhador = Image.new(x: @x, y: @y, l: @l, path: 'assets/mergulhador.png', z: 1)
    else
      mergulhador = Image.new(x: @x, y: @y, l: @l, path: 'assets/mergulhador1.png', z: 1)
    end
    mergulhador.width = 50
    mergulhador.height = 40

    mergulhador
  end

  def mov
    if(l == 1)
      @x += 5
    else
      @x -= 5
    end
  end

  def delet(mergulhador)
    if(@x < 0 || @x > 800)
      return true
    end
  end
end
