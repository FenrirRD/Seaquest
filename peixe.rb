class Peixe
  attr_accessor :x, :y, :l

  def initialize(x:, y:, l:)
    @x = x
    @y = y
    @l = l
  end

  def draw
    if(l == 0)
      peixe = Image.new(x: @x, y: @y, l: @l, path: 'assets/peixe.png', z: 1)
    else
      peixe = Image.new(x: @x, y: @y, l: @l, path: 'assets/peixe1.png', z: 1)
    end
    peixe.width = 60
    peixe.height = 40

    peixe
  end

  def mov
    if(l == 1)
      @x += 5
    else
      @x -= 5
    end
  end

  def delet(peixe)
    if(@x < 0 || @x > 800)
      return true
    end
  end
end
