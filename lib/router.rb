class Router

  def self.select_path
    command = clean_gets

    case command.to_i
    when 1 then add_book
    when 2 then find_book
    when 3 then edit_book
    when 4 then update_read_status
    when 5 then delete_book
    else puts "I don't know the '#{command}' command."
    end
  end

# Adding a book

  def self.add_book
    puts "Let's add a book!"
    puts "What is the title?"
    BooksController.add
    book = Book.last
    add_author(book)
    add_genre(book)
    add_others
    puts "#{book.title} has been added to your library!"
  end

  def self.add_author(book)
    puts "Who is the author?"
    author = AuthorsController.add
    book.authors << author
  end

  def self.add_genre(book)
    puts "What is the genre?"
    GenresController.add
    genre = Genre.last
    book.genres << genre
  end

  def self.add_others
    puts "Briefly describe the book"
    BooksController.describe
    puts "Have you read this book? (Y/N)"
    BooksController.is_read?
  end

# Finding book(s)

  def self.find_book
    puts "Let's find a book!"
    puts "1. Find All\n2. Search by author\n3. Search by title\n4. Search by genre\n5. Search by is read status"

    command = clean_gets
    case command.to_i
    when 1 then BooksController.find_all
    when 2 then AuthorsController.find_by_author
    when 3 then BooksController.find_by_title
    when 4 then GenresController.find_by_genre
    when 5 then BooksController.find_by_is_read
    else puts "I don't know the '#{command}' command."
    end
  end

# Editing a book

  def self.edit_book
    puts "Let's update a book!"
    puts "What would you like to update?\n1. A book's title\n2. A book's description\n3. An author's name\n4. Add another genre to a book\n5. Add another author to a book"
    command = clean_gets

    case command.to_i
    when 1, 2, 4, 5
      puts "What is the book title?"
      title = clean_gets
      puts "Who is the author?"
      author_name = clean_gets
      book = BooksController.find_book(title, author_name)
    end

    case command.to_i
    when 1 then BooksController.update_title(book)
    when 2 then BooksController.update_description(book)
    when 3 then AuthorsController.update_author_name
    when 4 then self.add_genre(book)
    when 5 then self.add_author(book)
    else puts "I don't know the '#{command}' command."
    end
  end

# Marking book as read

  def self.update_read_status
    puts "Let's mark a book as read!"
    puts "What is the title?"
    title = clean_gets
    puts "Who is the author"
    author_name = clean_gets
    book = BooksController.find_book(title, author_name)
    puts "Have you read this book? (Y/N)"
    BooksController.update_is_read(book)
  end
end

# Delete a book
  def delete_book
    puts "What is the title of the movie you would like to delete?"
    title = clean_gets
    puts "Who is the author?"
    author_name = clean_gets
    BooksController.delete_book(title, author_name)
  end
