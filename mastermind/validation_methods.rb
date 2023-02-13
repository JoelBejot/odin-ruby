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