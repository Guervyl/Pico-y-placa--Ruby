#file: main.rb

require "./pico_y_placa"

puts "Write the license plate number in this format: PBC2222 or PBC0222"
number = gets.chomp

puts "Write the day in English. Like Monday"
date = gets.chomp

puts "Write the time in this format: hour:minute. From 01:00 to 24:59 Ex: 09:05 "
time = gets.chomp

pico_y_placa = PicoYPlaca.new(number, date, time)
#pico_y_placa.number = "PBC2225"
#pico_y_placa.day = "WEDNESday"
#pico_y_placa.time = "09:20"

#puts pico_y_placa.number
#puts pico_y_placa.day
#puts pico_y_placa.time

if pico_y_placa.is_allow?
	puts "Can drive"
else
	puts "Not allowed to drive"
end
