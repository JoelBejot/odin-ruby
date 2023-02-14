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
  
  def validate_num
    answer = "invalid"
    while answer == "invalid"
      puts "In which space would you like to make your move?(1-9)"
      input = gets.chomp.to_i
      puts ""
      any = @total_moves.any? { |el| el == input }
      if input.between?(1, 9) && any == false
        @total_moves << input
        return input
        answer = "valid"
      end
    end
  end
end