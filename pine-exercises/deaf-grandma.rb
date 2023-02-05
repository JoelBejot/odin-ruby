puts "Say something to grandma."
count = 0
while (count < 3)
    year = rand(1930..1950)
    response = gets.chomp
    if (response != response.upcase)
        puts "HUH?! SPEAK UP, SONNY!"
        count = 0
    elsif (response != "BYE" and response == response.upcase)
        puts "NO, NOT SINCE " + year.to_s + "!"
        count = 0
    elsif (response == "BYE")
        count += 1
        puts "HEH? SAY THAT AGAIN!"
    end
end
