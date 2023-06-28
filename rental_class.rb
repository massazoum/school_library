class Rental
  attr_accessor :date, :person, :book

  def initialize(date, person, book)
    @date = date
    self.person = person
    self.book = book
  end
end
