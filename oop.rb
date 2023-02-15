module OffRoad
  def off_road
    puts "You enjoy going offroad and have tall ground clearance."
  end
end

class Vehicle
  attr_accessor :color
  attr_reader :model, :year
  @@num_vehicles = 0

  def initialize(make, model, year)
    @make = make
    @model = model
    @year = year
    @current_speed = 0
    @@num_vehicles += 1
  end

  def speed_up(number)
    @current_speed += number
    puts "You have accelerated #{number} miles per hour."
  end

  def slow_down(number)
    @current_speed -= number
    puts "You have slowed down #{number} miles per hour"
  end

  def stop
    @current_speed = 0
    puts "You have stopped."
  end

  def current_speed
    puts "You are going #{@current_speed} mph."
  end

  def self.number_of_vehicles?
    puts "You have created #{@@num_vehicles} vehicles."
  end

  def age
    "Your #{self.model} is #{years_old} years old."
  end

  private
  def years_old
    Time.now.year - self.year
  end
end

class MyCar < Vehicle
  VIN = 123456789
end

class MyTruck < Vehicle
  VIN = 987654321
  include OffRoad
end

eclipse = MyCar.new("Mitsubishi", "Eclipse", 2000)
p MyCar.ancestors
p MyTruck.ancestors
p Vehicle.ancestors
p eclipse.age


class Student
  def initialize(name, grade)
    @name = name
    @grade = grade
  end

  def better_grade_than?(other_student)
    grade > other_student.grade
  end

  protected
  def grade
    @grade
  end
end

joe = Student.new("Joe", 90)
bob = Student.new("Bob", 84)
puts "Well done!" if joe.better_grade_than?(bob)