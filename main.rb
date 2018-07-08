# import gem and C library
require 'ruby2d'
require 'ffi'

# import classes
require_relative 'submarino'
require_relative 'peixe'
require_relative 'mergulhador'

#module Driver
#  extend FFI::Library

#  ffi_lib 'driver/acesso.so'
#  attach_function :readDriver, [], :pointer
#end

# config window
set title: 'Submarino'
set width: 800, height: 600
set background: 'blue'

submarino = Submarino.new(x: 362.5, y: 270)
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
    mergulhador << Mergulhador.new(x: (0), y: rand(600), l: m) if (rand(1000) % 666).zero?
  else
    mergulhador << Mergulhador.new(x: (740), y: rand(600), l: m) if (rand(1000) % 666).zero?
  end
#  peixe << Peixe.new(x: rand(720), y: rand(520)) if (rand(1000) % 666).zero?
#  mergulhador << Mergulhador.new(x: rand(720), y: rand(520)) if (rand(1000) % 333).zero?

  peixe.each(&:draw)
  mergulhador.each(&:draw)

  #peixe @x += 10
  peixe.each(&:mov)
  mergulhador.each(&:mov)
#  pointer = Driver::readDriver
#  puts pointer.read_string
#  robot.walk(pointer.read_string)

  peixe.delete_if { |b| submarino.hasPeixe(b) }
#  peixe.delete_if { |b| peixe.delet(b)}
  mergulhador.delete_if { |b| submarino.hasMergulhador(b) }
#  mergulhador.delete_if { |b| mergulhador.delet(b)}
end

on :key_down do |event|
  close if event.key == 'escape'
end

show