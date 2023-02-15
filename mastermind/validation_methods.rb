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
  
def validate_num(guess, answer)
  int_array = []
  guess_array = guess.split(//)
  p guess_array
  guess_array.each do |str| 
    int_array << str.to_i 
  end
  p int_array
  if int_array.all? { |el| el.between?(1, 6) } && int_array.length == 4
    answer = true
    p answer
    @code_guesses = int_array
    p @code_guesses
    return answer
  else
    puts "Please enter valid numbers. (Ex. 6123)"
  end
end
