module Gallows
  def display_hangman(round)
      case round
      when 0
          puts "       -------"
          puts "       |     |"
          puts "       |     @"
          puts "       |    /|\\" 
          puts "       |     |"
          puts "       |    / \\"
          puts "  _____|_________"
          puts " /     |        /|"
          puts "______________ / /"
          puts "             |  /"
          puts "______________ /"
          puts ""
      when 1
          puts ""
          puts ""
          puts ""
          puts "" 
          puts ""
          puts ""
          puts "  _______________"
          puts " /              /|"
          puts "______________ / /"
          puts "             |  /"
          puts "______________ /"
          puts ""
      when 2
          puts "       -------"
          puts "       |"
          puts "       |"
          puts "       |" 
          puts "       |"
          puts "       |"
          puts "  _____|_________"
          puts " /     |        /|"
          puts "______________ / /"
          puts "             |  /"
          puts "______________ /"
          puts ""
      when 3
          puts "       -------"
          puts "       |"
          puts "       |     @"
          puts "       |" 
          puts "       |"
          puts "       |"
          puts "  _____|_________"
          puts " /     |        /|"
          puts "______________ / /"
          puts "             |  /"
          puts "______________ /"
          puts ""
      when 4
          puts "       -------"
          puts "       |"
          puts "       |     @"
          puts "       |     |" 
          puts "       |     |"
          puts "       |"
          puts "  _____|_________"
          puts " /     |        /|"
          puts "______________ / /"
          puts "             |  /"
          puts "______________ /"
          puts ""
      when 5
          puts "       -------"
          puts "       |"
          puts "       |     @"
          puts "       |     |\\" 
          puts "       |     |"
          puts "       |"
          puts "  _____|_________"
          puts " /     |        /|"
          puts "______________ / /"
          puts "             |  /"
          puts "______________ /"
          puts ""
      when 6
          puts "       -------"
          puts "       |"
          puts "       |     @"
          puts "       |    /|\\" 
          puts "       |     |"
          puts "       |      \\"
          puts "  _____|_________"
          puts " /     |        /|"
          puts "______________ / /"
          puts "             |  /"
          puts "______________ /"
          puts ""
      when 7
          puts "       -------"
          puts "       |"
          puts "       |     @"
          puts "       |    /|\\" 
          puts "       |     |"
          puts "       |    / \\"
          puts "  _____|_________"
          puts " /     |        /|"
          puts "______________ / /"
          puts "             |  /"
          puts "______________ /"
          puts ""
      when 8
          puts "       -------"
          puts "       |     |"
          puts "       |     @"
          puts "       |    /|\\" 
          puts "       |     |"
          puts "       |    / \\"
          puts "  _____|_________"
          puts " /     |        /|"
          puts "______________ / /"
          puts "             |  /"
          puts "______________ /"
          puts ""
      end
  end
end

def display_title()
  puts ""
  sleep(0.1)
  puts ""
  sleep(0.1)
  puts ""
  sleep(0.1)
  puts "{}    {}    {}{}     {}    {}    {}}}}}    {}      {}    {}{}     {}    {}"
  sleep(0.1)
  puts "{}    {}   {}  {}    {}}}  {}   {}    {}   {}}}  {{{}   {}  {}    {}}}  {}"
  sleep(0.1)
  puts "{}{{}}{}  {}{{}}{}   {} {} {}   {}         {} {{}} {}  {}{{}}{}   {} {} {}"
  sleep(0.1)
  puts "{}    {}  {}    {}   {}  {{{}   {}  {{{{   {}  {}  {}  {}    {}   {}  {{{}"
  sleep(0.1)
  puts "{}    {}  {}    {}   {}    {}    {}}}}}    {}      {}  {}    {}   {}    {}"
  sleep(0.1)
  puts ""
  sleep(0.1)
  puts ""
  sleep(0.1)
  puts ""
end

def display_guesses
  @secret_word.length.times do |i|
    print " #{@right_guesses[i]} "
  end
  puts ""
end

