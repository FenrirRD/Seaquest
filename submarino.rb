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
      puts @y
      @y -= 5 if @y > 100
    when 'd'
      #puts @y
      @y += 5 if @y < 540
      #puts @y
    when 'l'
      #puts @y
      @x -= 5 if @x > 5
      #puts @y
    when 'r'
      #puts @y
      @x += 5 if @x < 730
      #puts @y
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
