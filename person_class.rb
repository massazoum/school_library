class Person
  attr_reader :id
  attr_accessor :name, :age

  def initialize(name = 'Unknown', age = nil, parent_permission: true)
    @id = generate_id
    @name = name
    @age = age
    @parent_permission = parent_permission
  end

  def can_use_services?
    of_age? || @parent_permission
  end

  def generate_id
    rand(1..9999)
  end

  private

  def of_age?
    return false if @age.nil?

    @age >= 18
  end
end
