module Display
  def code_colors(num)
    case num
    when 1 then @code << "   1   ".colorize(background: :blue)
    when 2 then @code << "   2   ".colorize(background: :red)
    when 3 then @code << "   3   ".colorize(background: :green)
    when 4 then @code << "   4   ".colorize(background: :magenta)
    when 5 then @code << "   5   ".colorize(background: :yellow)
    when 6 then @code << "   6   ".colorize(background: :cyan)
    end
  end

  def display_whole_board
    puts ""
    puts "Secret Code: REDACTED REDACTED REDACTED REDACTED".colorize(background: :white)
    puts ""
    puts "Guess 1:     ________ ________ ________ ________"
    puts "Guess 2:     ________ ________ ________ ________"
    puts "Guess 3:     ________ ________ ________ ________"
    puts "Guess 4:     ________ ________ ________ ________"
    puts "Guess 5:     ________ ________ ________ ________"
    puts "Guess 6:     ________ ________ ________ ________"
    puts "Guess 7:     ________ ________ ________ ________"
    puts "Guess 8:     ________ ________ ________ ________"
    puts "Guess 9:     ________ ________ ________ ________"
    puts "Guess 10:    ________ ________ ________ ________"
    puts "Guess 11:    ________ ________ ________ ________"
    puts "Guess 12:    ________ ________ ________ ________"
  end

  def display_turns
  end
end