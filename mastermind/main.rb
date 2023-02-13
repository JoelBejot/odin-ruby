require 'pry-byebug'
require './validation_methods.rb'
require 'colorize'
require 'colorized_string'
require './display.rb'

class Mastermind
  include Display

  def initialize
    @@counter = 0
    @name1 = ""
    @name2 = ""
    @code = []
    @code_guesses = []
    @active_game = true
  end

  def game
    over = false
    #self.begin?
    #self.display_rules
    #self.set_code
    code_colors
    hint_colors
  end

  def begin?
    #binding.pry
    start_game = false
    answer = nil
    unless start_game
      puts "Do you want to play Mastermind? (y/n)"
      answer = gets.chomp.downcase
      puts ""
      validate_boolean(answer)
      if answer == "n"
        puts "Until next time!" 
        puts ""
        exit
      end
      puts "OK! Let's begin."
      puts ""
      puts "What would player One like to be called?"
      @name1 = gets.chomp
      puts ""
      puts "What would player Two like to be called?"
      @name2 = gets.chomp
      puts ""
      puts "OK! I'll call Player One #{@name1} and Player Two #{@name2}."
      start_game = true
    end
  end

  def display_rules
    understand = nil
    puts "Do you need to see the rules? (y/n)"
    answer = gets.chomp.downcase
    puts ""
    validate_boolean(answer)
    return if answer == "n"
    while understand != "y"
      puts "Here are the rules:"
      sleep(1)
      puts "This is Mastermind, designed to be played by one person."
      sleep(1)
      puts "This is a codebreaker game, where one player is the code-maker, and the other is the code-breaker."
      puts "At this time, the computer decides a random code, and the person tries to break the code within 12 tries."
      puts "The code-maker chooses a code that is four 'pegs' long, from six colors."
      puts "Press any key to continue..."
      STDIN.getch
      puts "The code-breaker gets twelve guess to break the code."
      puts "The code-breaker will get hints if they have one of two things correct:"
      puts "You get a black peg if you have the right color, wrong position,"
      puts "and a white peg if you have the right color, right position."
      puts "The code-breaker continues until they run out of guesses or they break the code!"
      puts "Do you understand?(y/n)"
      understand = gets.chomp.downcase
      puts ""
      validate_boolean(understand)
      return if understand == "y"
      puts "OK, here are the rules again."
    end
  end

end

game = Mastermind.new
game.game
