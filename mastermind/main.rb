require 'pry-byebug'
require 'colorize'
require 'colorized_string'

require './display.rb'
require './validation_methods.rb'

class Mastermind
  include Display

  attr_accessor :name1, :name2

  def initialize
    @@counter = 0
    @name1 = name1
    @name2 = name2
    @code_nums = []
    @code = []
    @hints = []
    @code_guesses = ""
    @active_game = true
    @correct_position = "\u2022".colorize(:black).encode('utf-8')
    @correct_color = "\u2022".colorize(:white).encode('utf-8')
  end

  def game
    over = false
    turn = 0
    #self.begin?
    #self.display_rules
    self.set_code
    self.display_whole_board
    while over == false
      turn += 1
      self.get_guess
      self.compare_guess_with_code
      self.winner?(over)
      p over
      if turn > 12
        break
      end
    end
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
      puts "The code-breaker gets twelve guesses to break the code."
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

  def set_code
    4.times do |num|
      num = rand(1..6)
      @code_nums << num
      code_colors(num)
    end
    puts @code_nums
    puts "#{@code[0]}  #{@code[1]}  #{@code[2]}  #{@code[3]}"
  end

  def get_guess
    answer = false
    puts "Please enter four numbers, 1-6"
    unless answer
      @code_guesses = gets.chomp
      validate_num(@code_guesses, answer)
      return if answer
    end
  end

  def compare_guess_with_code
    # compare @code_nums with @code_guesses. 
    @code_nums.each_index do |index|
      p @code_nums[index]
      p @code_guesses[index]
      if @code_nums[index] == @code_guesses[index]
        #reward black peg
        @hints << @correct_position
        puts @hints
      elsif @code_guesses.any? { |el| el == @code_nums[index] }
        #reward white peg
        @hints << @correct_color
        puts @hints
      end
    end
  end

  def winner?(winner)
    if @code_guesses == @code_nums
      winner = true
      return winner
    else 
      winner = false
      return winner
    end
  end


end

game = Mastermind.new
game.game
