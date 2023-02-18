require 'colorize'
require 'io/console'

require './display.rb'
require './validation_methods.rb'

class Mastermind
  include Display

  attr_accessor :name1, :name2, :role

  CORRECT_POSITION = "\u2022".colorize(:red).encode('utf-8')
  CORRECT_COLOR = "\u2022".colorize(:white).encode('utf-8')
  $counter = {player: 0, computer: 0}

  def initialize
    @name1 = name1
    @role = role
    @turn = 0
    @user_code = ""
    @code_nums = []
    @code = []
    @hints = {}
    @guess_hash = {}
    @guess_hash_colors = {}
    @code_guesses = ""
    @computer_guesses = []
    @computer_keeps = [0, 0, 0, 0]
    @active_game = true
    @again = true
  end

  # This is the method that calls all the other methods to play the game.
  def game
    over = false
    self.begin?
    while @again == true
      self.display_rules
      self.maker_or_breaker
      while @role == 1
        over = maker_game(over)
        maker_who_won?(over)
        puts "The score is Computer: #{$counter[:computer]}, #{@name1}: #{$counter[:player]}"
        choose = play_again?
        self.maker_or_breaker
        initialize
      end
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

  protected
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
    sleep(0.5)
    puts "This is Mastermind, designed to be played by one person."
    sleep(0.5)
    puts "This is a codebreaker game, where you can choose to be the code-maker or the code-breaker."
    puts "Press any key to continue."
    STDIN.getch
    puts "If you choose to be the code-maker, you choose a code that is four 'pegs' long, from six colors"
    sleep(0.5)
    puts "If you choose to be the code-breader, you computer chooses a code."
    puts "And you have eight tries to guess the code correctly."
    sleep(0.5)
    puts "The code-breaker will get hints if they have one of two things correct:"
    puts "You get a red peg if you have the right color, wrong position,"
    puts "and a white peg if you have the right color, right position."
    puts "The code-breaker continues until they run out of guesses or they break the code!"
    puts ""
  end

  def maker_or_breaker
    input = false
    puts "Would you like to be the code-maker(1) or the coder-breaker?(2)"
    while input == false
      @role = gets.chomp.to_i
      if @role == 1
        puts "Ok! You can set the code, and the computer will guess."
        input = true
        return
      elsif @role == 2
        puts "Ok! The computer will set the code, and you can guess."
        input = true
        return
      else
        puts "Please enter '1' or '2'."
      end
    end
  end

  # Most of the maker version of the game is here.
  def maker_game(over)
    puts "What would you like the code to be?"
    puts "Please enter four digits 1-6."
    @user_code = gets.chomp
    @code_nums = @user_code.split(//)
    @code_nums.map! { |str| str.to_i }

    puts "Now the computer will guess."
    over = false
    while over == false
      @turn += 1
      computer_guess
      compare_user_code
      @guess_hash[@turn] = @computer_guesses
      @guess_hash_colors[@turn] = []
      self.guess_colors(@guess_hash[@turn])
      @hints[@turn] = []
      @hints[@turn] = computer_hints(@hints[@turn])
      self.board
      if @computer_guesses == @code_nums
        return true
      end
      sleep(0.5)
      if @turn >= 8
        break
      end
    end
    return false
  end

  # Only choose numbers if the hint is not given.
  def computer_guess
    @computer_guesses = [0,0,0,0]
    @computer_guesses.each_index do |index|
      if @computer_keeps[index] == 0
        @computer_guesses[index] = rand(1..6)
      else @computer_keeps != 0
        @computer_guesses[index] = @computer_keeps[index]
      end
    end
  end

  # Compare computer guesses with the user code.
  def compare_user_code
    @computer_guesses.each_index do |index|
      if @computer_guesses[index] == @code_nums[index]
        @computer_keeps[index] = @computer_guesses[index]
      end
    end
  end  

  # Add the hint peg to the @hints hash.
  def computer_hints(array)
    @code_nums.each_index do |index|
      if @code_nums[index] == @computer_guesses[index]
        array << CORRECT_POSITION
      end
    end
    array
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

  # Give red or white pegs as hints to the user
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

  # if computer won, increment their score by one. If the player won, increment their score by one.
  def who_won?(winner)
    if winner == true
      puts "Congratulations! You cracked the code."
      $counter[:player] += 1
    else
      puts "The computer won this time."
      puts "The correct code was #{@code[0]}  #{@code[1]}  #{@code[2]}  #{@code[3]}."
      $counter[:computer] += 1
    end
  end
  
  # slightly different version of who_won method for the maker version of the game.
  def maker_who_won?(winner)

    if winner == true
      puts "The computer cracked the code."
      $counter[:computer] += 1
    else
      puts "Your code was unbreakable!"
      $counter[:player] += 1
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
