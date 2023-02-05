puts "What year were you born in?"
year = gets.chomp
puts "What month (number) were you born in?"
month = gets.chomp
puts "What day were you born in?"
day = gets.chomp
birthdate = Time.new(year, month, day)
current_date = Time.new
difference = current_date - birthdate

while (difference - (60*60*24*365) > 0)
    puts "SPANK!"
    difference = difference - (60*60*24*365)
end

