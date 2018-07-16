require 'ruby2d'
require 'ffi'

module Driver
  extend FFI::Library

  ffi_lib 'driver/acesso.so'
  attach_function :writeDriver, [ :string ], :int
end

# config window
set title: 'Seaquest'
set width: 200, height: 200

sl = Triangle.new(x1: 15, y1: 100, x2: 60, y2: 70, x3: 60, y3: 130, color: 'red')
su = Triangle.new(x1: 100, y1: 15, x2: 70, y2: 60, x3: 130, y3: 60, color: 'red')
sr = Triangle.new(x1: 185, y1: 100, x2: 140, y2: 70, x3: 140, y3: 130, color: 'red')
sd = Triangle.new(x1: 100, y1: 185, x2: 70, y2: 140, x3: 130, y3: 140, color: 'red')

on :key_down do |event|
  case event.key
  when 'up'
    su.color = 'blue'
    Driver.writeDriver('u')
  when 'down'
    sd.color = 'blue'
    Driver.writeDriver('d')
  when 'left'
    sl.color = 'blue'
    Driver.writeDriver('l')
  when 'right'
    sr.color = 'blue'
    Driver.writeDriver('r')
  end
end

on :key_up do |event|
  case event.key
  when 'up'
    su.color = 'red'
    #Driver.writeDriver('u')
  when 'down'
    sd.color = 'red'
    #Driver.writeDriver('d')
  when 'left'
    sl.color = 'red'
    #Driver.writeDriver('l')
  when 'right'
    sr.color = 'red'
    #Driver.writeDriver('r')
  end
end

on :key_down do |event|
  close if event.key == 'escape'
end

show
