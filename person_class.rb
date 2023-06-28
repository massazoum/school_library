require_relative 'nameable'

class Person < Nameable
  attr_accessor :name, :age
  attr_reader :id

  def initialize(age, name = 'Unknown', parent_permission: true)
    super()
    @id = Random.rand(1..100)
    @name = name
    @age = age
    @parent_permission = parent_permission
  end

  def correct_name
    @name
  end

  def add_rental(rental)
    rental.person = self
    rentals << rental
  end

  def can_use_services?
    of_age? || @parent_permission
  end

  private

  def of_age?
    return false if @age.nil?

    @age >= 18
  end
end
