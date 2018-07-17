class Menu
  attr_accessor :x, :y, :w, :h, :c

  def initialize()
    @x, @y, @width, @height, @color = x, y, w, h, c
  end

  $pontos = 0

  def draw
    menu = Rectangle.new(x: 0, y: 0, width: 800, height: 140, color: 'black')
    Text.new(x: 250, text: "SEAQUEST", size: 60, font: "assets/roboto-bold.ttf")
    Text.new(x: 10, text: "Score: ", size: 20, font: "assets/roboto-bold.ttf")
    Text.new(x: 70, text: $pontos, size: 20, font: "assets/roboto-bold.ttf")
    Text.new(x: 580, y: 5, text: "By: RODRIGO DALLAGNOL", size: 15, font: "assets/roboto-bold.ttf")
    Text.new(x: 580, y: 30, text: "       FLAVIO DA SILVA", size: 15, font: "assets/roboto-bold.ttf")
    menu
  end

end
