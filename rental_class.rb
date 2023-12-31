class Rental
  attr_accessor :date
  attr_reader :book, :person

  def initialize(date, book, person)
    @date = date
    @book = book
    book.rentals << self unless book.nil?
    @person = person
    person.rentals << self unless person.nil?
  end
end
