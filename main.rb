# import gem and C library
require 'ruby2d'
require 'ffi'

# import classes
require_relative 'submarino'
require_relative 'peixe'
require_relative 'mergulhador'

module Driver
  extend FFI::Library

  ffi_lib 'driver/acesso.so'
  attach_function :readDriver, [], :char
end

# config window
set title: 'Submarino'
set width: 800, height: 600
set background: 'blue'

submarino = Submarino.new(x: 362.5, y: 270,path: 'assets/submarino.png')
peixe = []
mergulhador = []

update do
  clear

  submarino.draw
  a = rand(2)
  if(a == 1)
    peixe << Peixe.new(x: (0), y: rand(600),l: a) if (rand(1000) % 100).zero?
  else
    peixe << Peixe.new(x: (740), y: rand(600), l: a) if (rand(1000) % 100).zero?
  end

  m = rand(2)
  if(m == 1)
    mergulhador << Mergulhador.new(x: (0), y: rand(600), l: m) if (rand(1000) % 566).zero?
  else
    mergulhador << Mergulhador.new(x: (740), y: rand(600), l: m) if (rand(1000) % 566).zero?
  end

  peixe.each(&:draw)
  mergulhador.each(&:draw)

  pointer = Driver.readDriver
  puts pointer.chr
  submarino.walk(pointer.chr)
  peixe.each(&:mov)
  mergulhador.each(&:mov)
  #  pointer = Driver::readDriver
  #  @pointer
  #  puts pointer.read_string
  #  submarino.walk(pointer.read_string)

  peixe.delete_if { |b| submarino.hasPeixe(b) }
#  peixe.delete_if { |b| peixe.delet(b)}
  mergulhador.delete_if { |b| submarino.hasMergulhador(b) }
#  mergulhador.delete_if { |b| mergulhador.delet(b)}
end

on :key_down do |event|
  close if event.key == 'escape'
end

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
