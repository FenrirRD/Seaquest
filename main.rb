# import gem and C library
require 'ruby2d'
require 'ffi'

# import classes
require_relative 'submarino'
require_relative 'peixe'
require_relative 'mergulhador'
require_relative 'menu'

$i = 0

module Driver
  extend FFI::Library

  ffi_lib 'driver/acesso.so'
  attach_function :readDriver, [], :char
end

# config window
set title: 'Submarino'
set width: 800, height: 600
set background: 'blue'

#menu = Menu.new(x: 0, y: 0, color: 'black')

submarino = Submarino.new(x: 360, y: 100,path: 'assets/submarino.png')
menu = Menu.new()
peixe = []
mergulhador = []

update do
  clear
  #Mvovimenta Submarino
  submarino.draw
  menu.draw
  #Gera Peixe
  a = rand(2)
  if(a == 1)
    peixe << Peixe.new(x: (0), y: rand(500)+140,l: a) if (rand(1000) % 100).zero?
  else
    peixe << Peixe.new(x: (740), y: rand(500)+140, l: a) if (rand(1000) % 100).zero?
  end
  #Gera Mergulhador
  m = rand(2)
  if(m == 1)
    mergulhador << Mergulhador.new(x: (0), y: rand(500)+140, l: m) if (rand(1000) % 566).zero?
  else
    mergulhador << Mergulhador.new(x: (740), y: rand(500)+140, l: m) if (rand(1000) % 566).zero?
  end
  #Movimenta Peixe e Mergulhador
  peixe.each(&:draw)
  mergulhador.each(&:draw)

  pointer = Driver.readDriver
  #puts pointer.chr
  submarino.walk(pointer.chr)
  peixe.each(&:mov)
  mergulhador.each(&:mov)

  #Deleta quando toca no submarino
  mergulhador.delete_if { |b| submarino.hasMergulhador(b) }
  peixe.delete_if { |b| submarino.hasPeixe(b) }

  if($i == 1)
    submarino.restart
    peixe.clear
    mergulhador.clear
    $i = 0
    $pontos = 0
  else
  end

end
#Fecha o jogo
on :key_down do |event|
  close if event.key == 'escape'
end

#teste sem o Driver
#on :key_held do |event|
#  submarino.walk('u') if event.key == 'w' || event.key == 'up'
#  submarino.walk('d') if event.key == 's' || event.key == 'down'
#  submarino.walk('l') if event.key == 'a' || event.key == 'left'
#  submarino.walk('r') if event.key == 'd' || event.key == 'right'
#end
#on :key_up do |event|
#
#end

show
