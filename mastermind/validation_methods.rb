def validate_boolean(answer)
  while answer
    case answer
    when "y"  
      return
    when "yes"
      return "y"
    when "n"
      return
    when "no"
      return "n"
    else 
      puts "Please enter a valid response. (y/n)"
      answer = gets.chomp.downcase
      puts ""
    end
  end
end
  
def validate_num(guess)
  int_array = []
  guess_array = guess.split(//)
  guess_array.each do |str| 
    int_array << str.to_i 
  end
  if int_array.all? { |el| el.between?(1, 6) } && int_array.length == 4
    @code_guesses = int_array
    return true
  else
    puts "Please enter valid numbers. (Ex. 6123)"
    return false
  end
end

