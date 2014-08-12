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

# Adding a book

  def self.add_book
    puts "Let's add a book!"
    puts "What is the title?"
    books_controller = BooksController.new()
    books_controller.add
    book = Book.last
    add_author(book)
    add_genre(book)
    add_others(books_controller)
    book_name = book.title
    puts "#{book_name} has been added to your library!"
  end

  def self.add_author(book)
    puts "Who is the author?"
    authors_controller = AuthorsController.new()
    author = authors_controller.add
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

# Finding book(s)

  def self.find_book
    puts "Let's find a book!"
    puts "1. Find All\n2. Search by author\n3. Search by title\n4. Search by genre\n5. Search by is read status"

    books_controller = BooksController.new()
    authors_controller = AuthorsController.new()
    genres_controller = GenresController.new()
    command = clean_gets
    case command.to_i
    when 1 then books_controller.find_all
    when 2 then authors_controller.find_by_author
    when 3 then books_controller.find_by_title
    when 4 then genres_controller.find_by_genre
    when 5 then books_controller.find_by_is_read
    else puts "I don't know the '#{command}' command."
    end
  end

# Editing a book

  def self.edit_book
    puts "Let's edit a book!"
  end

# Marking book as read

  def self.update_read_status
    puts "Let's mark a book as read!"
    puts "What is the title?"
    title = clean_gets
    puts "Who is the author"
    author_name = clean_gets
    books_controller = BooksController.new()
    book = books_controller.find_book(title, author_name)
    puts "Have you read this book? (Y/N)"
    books_controller.update_is_read(book)
  end
end
