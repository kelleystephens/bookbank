class BooksController

  def add
    title = clean_gets
    Book.create(title: title)
  end

  def describe
    description = clean_gets
    book = Book.last
    book.description = description
    book.save
  end

  def is_read?
    answer = clean_gets.downcase
    book = Book.last
    book.is_read = answer
    book.save
  end
end
