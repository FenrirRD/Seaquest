class Submarino
  attr_accessor :x, :y, :path

  def initialize(x:, y:, path:)
    @x = x
    @y = y
    @path = 'assets/submarino.png'
  end

  def walk(string)
    @path  = 'assets/submarino1.png' if string == 'r'
    @path  = 'assets/submarino.png' if string == 'l'
    case string
    when 'u'
      @y -= 5 if @y > 100
    when 'd'
      @y += 5 if @y < 540
    when 'l'
      @x -= 5 if @x > 5
    when 'r'
      @x += 5 if @x < 730
    end
  end

  def draw
    submarino = Image.new(x: @x, y: @y, path: @path, z: 2)

    submarino.width = 75
    submarino.height = 60

    submarino
  end

  def hasPeixe(peixe)
    right = @x + 75
    left = @x
    up = @y + 10
    down = @y + 70

    #mesma coluna e x perto
    if (peixe.x >= left && (peixe.x + 60) <= right)
      if (peixe.y <= down && (peixe.y + 40) >= down)
        return true
      end

      if (peixe.y <= up && (peixe.y + 40) >= up)
        return true
      end
    end
    # mesma linha e y perto
    if (peixe.y >= up && (peixe.y + 40) <= down)
      if (peixe.x <= left && (peixe.x + 60) >= left)
        return true
      end

      if (peixe.x <= right && (peixe.x + 60) >= right)
        return true
      end
    end
    #canto superior direito
    if (peixe.y <= up && (peixe.y + 40) >= up)
      if (peixe.x <= left && (peixe.x + 60) >= left)
        return true
      end

      if (peixe.x <= right && (peixe.x + 60) >= right)
        return true
      end
    end
    #mesma coluna e x perto
    if (peixe.x >= left && (peixe.x + 60) <= right)
      if (peixe.y <= down && (peixe.y + 40) >= down)
        return true
      end

      if (peixe.y <= up && (peixe.y + 40) >= up)
        return true
      end
    end

    if (peixe.x >= 810 || peixe.x <= -10)
      return true
    end
  end
  def hasMergulhador(mergulhador)
    right = @x + 75
    left = @x
    up = @y + 10
    down = @y + 70

    #mesma coluna e x perto
    if (mergulhador.x >= left && (mergulhador.x + 60) <= right)
      if (mergulhador.y <= down && (mergulhador.y + 40) >= down)
        return true
      end

      if (mergulhador.y <= up && (mergulhador.y + 40) >= up)
        return true
      end
    end
    # mesma linha e y perto
    if (mergulhador.y >= up && (mergulhador.y + 40) <= down)
      if (mergulhador.x <= left && (mergulhador.x + 60) >= left)
        return true
      end

      if (mergulhador.x <= right && (mergulhador.x + 60) >= right)
        return true
      end
    end
    #canto superior direito
    if (mergulhador.y <= up && (mergulhador.y + 40) >= up)
      if (mergulhador.x <= left && (mergulhador.x + 60) >= left)
        return true
      end

      if (mergulhador.x <= right && (mergulhador.x + 60) >= right)
        return true
      end
    end
    #mesma coluna e x perto
    if (mergulhador.x >= left && (mergulhador.x + 60) <= right)
      if (mergulhador.y <= down && (mergulhador.y + 40) >= down)
        return true
      end

      if (mergulhador.y <= up && (mergulhador.y + 40) >= up)
        return true
      end
    end

    if (mergulhador.x >= 810 || mergulhador.x <= -10)
      return true
    end
  end
end
