require 'sphero'

my_sphero = Dir.glob("/dev/tty.Sphero*").first
$SPHERO = Sphero.new(my_sphero)