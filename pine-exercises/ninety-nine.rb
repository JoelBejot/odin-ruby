number_bottles = 99
while number_bottles > 0
    puts number_bottles.to_s + " bottles of beer on the wall,"
    puts number_bottles.to_s + " bottles of beer!"
    number_bottles -= 1
    puts "Take one down, pass it around, " 
    puts number_bottles.to_s + " bottles of beer on the wall!"
    puts ""

end