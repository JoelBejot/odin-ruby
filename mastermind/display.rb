# Just a few methods for displaying the code and guesses.
# Displaying the board is a loop that displays the whole board each time.

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

  def guess_colors(arr)
    arr.each do |num|
      case num
      when 1 then @guess_hash_colors[@turn] << "    1    ".colorize(background: :blue)
      when 2 then @guess_hash_colors[@turn] << "    2    ".colorize(background: :red)
      when 3 then @guess_hash_colors[@turn] << "    3    ".colorize(background: :green)
      when 4 then @guess_hash_colors[@turn] << "    4    ".colorize(background: :magenta)
      when 5 then @guess_hash_colors[@turn] << "    5    ".colorize(background: :yellow)
      when 6 then @guess_hash_colors[@turn] << "    6    ".colorize(background: :cyan)
      end
    end
    @guess_hash_colors[@turn]
  end

  def board
    turn = 1
    puts "Secret Code: REDACTED  REDACTED  REDACTED  REDACTED ".colorize(color: :blue, background: :white)
    puts ""
    8.times do
      if @guess_hash_colors.has_key?(turn)
        puts "Guess #{turn}:     #{@guess_hash_colors[turn][0]} #{@guess_hash_colors[turn][1]} #{@guess_hash_colors[turn][2]} #{@guess_hash_colors[turn][3]}" 
        print "Hints: #{@hints[turn][0].to_s}  #{@hints[turn][1].to_s}  #{@hints[turn][2].to_s}  #{@hints[turn][3].to_s}"
        puts ""
        puts ""
      else
        puts "Guess #{turn}:     _________ _________ _________ _________"
        puts ""
      end
      turn += 1
    end
  end
end