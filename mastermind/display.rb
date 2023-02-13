module Display
  def code_colors
    puts "   1   ".colorize(background: :blue)
    puts "   2   ".colorize(background: :red)
    puts "   3   ".colorize(background: :green)
    puts "   4   ".colorize(background: :magenta)
    puts "   5   ".colorize(background: :yellow)
    puts "   6   ".colorize(background: :cyan)
  end

  def hint_colors
    puts "\u2022".colorize(:black).encode('utf-8')
    puts "\u2022".colorize(:white).encode('utf-8')
  end
end