require 'colorize'

require './display.rb'
require './validation_methods.rb'

class Mastermind
  include Display

  attr_accessor :name1, :name2

  CORRECT_POSITION = "\u2022".colorize(:red).encode('utf-8')
  CORRECT_COLOR = "\u2022".colorize(:white).encode('utf-8')
  $counter = {player: 0, computer: 0}

  def initialize

    @name1 = name1
    @name2 = name2
    @turn = 0
    @code_nums = []
    @code = []
    @hints = {}
    @guess_hash = {}
    @guess_hash_colors = {}
    @code_guesses = ""
    @active_game = true
    @again = true
  end

  def game
    over = false
    self.begin?
    while @again == true
      self.display_rules
      self.set_code
      self.board
      while over == false
        @turn += 1
        self.get_guess
        @guess_hash[@turn] = @code_guesses
        @guess_hash_colors[@turn] = []
        self.guess_colors(@guess_hash[@turn])
        @hints[@turn] = []
        @hints[@turn] = compare_guess_with_code(@hints[@turn])
        self.board
        over = self.winner?(over)
        if @turn >= 8
          break
        end
      end
      who_won?(over)
      puts "The score is Computer: #{$counter[:computer]}, #{@name1}: #{$counter[:player]}"
      over = play_again?
      initialize
    end
  end

  def begin?
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
      puts "What would you like to be called?"
      @name1 = gets.chomp
      puts ""
      # puts "What would player Two like to be called?"
      # @name2 = gets.chomp
      # puts ""
      puts "OK #{@name1}."
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
    puts "Here are the rules:"
    sleep(1)
    puts "This is Mastermind, designed to be played by one person."
    sleep(1)
    puts "This is a codebreaker game, where one player is the code-maker, and the other is the code-breaker."
    puts "At this time, the computer decides a random code, and the person tries to break the code within eight tries."
    puts "The code-maker chooses a code that is four 'pegs' long, from six colors."
    puts "Press any key to continue..."
    #STDIN.getch
    puts "The code-breaker gets eight guesses to break the code."
    puts "The code-breaker will get hints if they have one of two things correct:"
    puts "You get a red peg if you have the right color, wrong position,"
    puts "and a white peg if you have the right color, right position."
    puts "The code-breaker continues until they run out of guesses or they break the code!"
    puts ""
  end

  def set_code
    4.times do |num|
      num = rand(1..6)
      @code_nums << num
      code_colors(num)
    end
  end

  def get_guess
    answer = false
    puts "Please enter four numbers, 1-6"
    while answer == false
      @code_guesses = gets.chomp
      answer = validate_num(@code_guesses)
      return if answer == true
    end
  end

  def compare_guess_with_code(array)
    @code_nums.each_index do |index|
      if @code_nums[index] == @code_guesses[index]
        array << CORRECT_POSITION
      elsif @code_guesses.any? { |el| el == @code_nums[index] }
         array << CORRECT_COLOR
      end
    end
    return array
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

  def who_won?(winner)
    # if computer won, increment their score by one. If the player won, increment their score by one.
    if winner == true
      puts "Congratulations! You cracked the code."
      $counter[:player] += 1
    else
      puts "The computer won this time."
      puts "The correct code was #{@code[0]}  #{@code[1]}  #{@code[2]}  #{@code[3]}."
      $counter[:computer] += 1
    end
  end

  def play_again?
    puts "Would you like to play again? (y/n)"
    @again = gets.chomp.downcase
    validate_boolean(@again)
    if @again == "n"
      @again = false
      puts "See you next time!"
      exit
    else 
      @again = true
    end
    return over = false
  end
end

game = Mastermind.new.game
