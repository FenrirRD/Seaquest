class Submarino
  attr_accessor :x, :y

  def initialize(x:, y:)
    @x = x
    @y = y
  end

  def walk(string)
    case string
    when 'u'
      @y -= 0.1
    when 'd'
      @y += 0.1
    when 'l'
      @x -= 0.1
    when 'r'
      @x += 0.1
    end
  end

  def draw
    submarino = Image.new(x: @x, y: @y, path: 'assets/submarino.png', z: 2)
    submarino.width = 75
    submarino.height = 60

    submarino
  end

  def hasPeixe(peixe)
    right = @x + 75
    left = @x
    up = @y
    down = @y + 60

    if (left >= peixe.x && left <= peixe.x + 60)
      if (up >= peixe.y && up <= peixe.y + 40)
        return true
      end

      if (down >= peixe.y && down <= peixe.y + 40)
        return true
      end
    end

    if (right >= peixe.x && right <= peixe.x + 60)
      if (up >= peixe.y && up <= peixe.y + 40)
        return true
      end

      if (down >= peixe.y && down <= peixe.y + 40)
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
    up = @y
    down = @y + 60

    if (left >= mergulhador.x && left <= mergulhador.x + 60)
      if (up >= mergulhador.y && up <= mergulhador.y + 40)
        return true
      end

      if (down >= mergulhador.y && down <= mergulhador.y + 40)
        return true
      end
    end

    if (right >= mergulhador.x && right <= mergulhador.x + 60)
      if (up >= mergulhador.y && up <= mergulhador.y + 40)
        return true
      end

      if (down >= mergulhador.y && down <= mergulhador.y + 40)
        return true
      end
    end
    if (mergulhador.x >= 810 || mergulhador.x <= -10)
      return true
    end
  end
end
