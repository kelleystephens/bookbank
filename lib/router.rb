class Router

  def self.select_path
    command = clean_gets

    case command.to_i
    when 1 then add_book
    when 2 then find_book
    when 3 then edit_book
    when 4 then update_read_status
    else puts "I don't know the '#{command}' command."
    end
  end

  def self.add_book
    puts "Let's add a book!"
    puts "What is the title?"
    books_controller = BooksController.new()
    books_controller.add
    book = Book.last
    add_author(book)
    add_genre(book)
    add_others(books_controller)
  end

  def self.add_author(book)
    puts "Who is the author?"
    authors_controller = AuthorsController.new()
    authors_controller.add
    author = Author.last
    book.authors << author
  end

  def self.add_genre(book)
    puts "What is the genre?"
    genres_controller = GenresController.new()
    genres_controller.add
    genre = Genre.last
    book.genres << genre
  end

  def self.add_others(books_controller)
    puts "Briefly describe the book"
    books_controller.describe
    puts "Have you read this book? (Y/N)"
    books_controller.is_read?
  end

  def self.find_book
    puts "Let's find a book!"
  end

  def self.edit_book
    puts "Let's edit a book!"
  end

  def self.update_read_status
    puts "Let's mark a book as read!"
  end
end
