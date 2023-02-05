puts "LEAP YEARS. Name a starting year."
starting = gets.chomp.to_i
puts "Thank you. Now name an ending year."
ending = gets.chomp.to_i
puts "Thank you. Here are the leap years."
difference = ending - starting

while (difference >= 0)
    year = ending - difference 
    if (year % 400 == 0)
        puts year
    elsif ((year % 4 == 0) and (year % 100 != 0))
        puts year
    end
    difference -= 1
end