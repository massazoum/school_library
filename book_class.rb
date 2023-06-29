class Book
  attr_accessor :title, :author

  def initialize(title, author)
    @title = title
    @author = author
  end

  def add_rental(rental)
    rental.book = self
    rentals << rental
  end
end
