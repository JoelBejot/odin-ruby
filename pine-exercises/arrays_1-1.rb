responses = []

while (responses.last != "")
    entry = gets.chomp
    responses.push entry
    puts responses
end
# puts responses.sort
puts responses.select {|v| v =~ /[abcdefghijklmnopqrstuvwxyz]/ }