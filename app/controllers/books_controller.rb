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

  def find_book(title, author_name)
    author = Author.where(name: author_name).first
    author.books.where(title: title).first
  end

  def update_is_read(book)
    status = clean_gets.downcase
    book.update(is_read: "#{status}")
    puts "#{book.title} has been marked as read" if status == "y"
    puts "#{book.title} has been marked as not read" if status == "n"
  end
end
