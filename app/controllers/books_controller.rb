class BooksController

  def self.add
    title = clean_gets
    Book.create(title: title)
  end

  def self.delete_book(title, author_name)
    book = Author.where(name: author_name).first.books.where(title: title).first
    book.destroy
    puts "Book deleted!"
  end

  def self.describe
    description = clean_gets
    book = Book.last
    book.description = description
    book.save
  end

  def self.find_all
    books = Book.all.order("title asc")
    if books.length >=1
      books.each_with_index do | book, index |
        puts "#{index + 1}. #{book.title} by #{book.authors.first.name}"
      end
      route("all", nil)
    else
      puts "Sorry, no books were found"
    end
  end

  def self.find_book(title, author_name)
    author = Author.where(name: author_name).first
    if author
      author.books.where(title: title).first
    else
      puts "Unable to find book, please try again"
      Router.update_edit_book
    end
  end

  def self.find_by_index(command, find_by, name)
    case find_by
    when "all" then books = Book.all.order("title asc")
    when "author" then books = Author.where(name: name).first.books.order("title asc")
    when "title" then books = Book.where(title: name)
    when "genre" then books = Genre.where(name: name).first.books.order("title asc")
    else books = Book.where(is_read: name)
    end

    book = books[command.to_i - 1]
    book ? view(book) : (puts "Invalid selection")
  end

  def self.find_by_is_read
    puts "Search books that are: Read or Unread?"
    status = clean_gets
    status == "Read" ? status = "Y" : status = "N"
    books = Book.where(is_read: status).all
    if books.length >=1
      books.each_with_index do |book, index|
        puts "#{index + 1}. #{book.title} by #{book.authors.first.name}"
      end
      route("is_read", status)
    else
      puts "Unable to find books that are #{status}, please try again"
      Router.find_book
    end
  end

  def self.find_by_title
    puts "What title would you like to search for?"
    title = clean_gets
    books = Book.where(title: title).all
    if books.length >= 1
      books.each_with_index do |book, index|
        puts "#{index + 1}. #{book.title} by #{book.authors.first.name}"
      end
      route("title", title)
    else
      puts "Unable to find books with the title #{title}, please try again"
      Router.find_book
    end
  end

  def self.is_read?
    answer = clean_gets
    book = Book.last
    book.is_read = answer
    book.save
  end

  def self.route(find_by, name)
    puts "Enter number to view a book's details or DONE to finish"
    command = clean_gets
    case command
    when "Done" then puts "Thanks for using BookBank!"
    when /\d+/ then find_by_index(command, find_by, name)
    else puts "I don't know the #{command} command"
    end
  end

  def self.update_is_read(book)
    book_name = book.title
    status = clean_gets
    book.update(is_read: status)
    puts "#{book_name} has been marked as read" if status == "Y"
    puts "#{book_name} has been marked as not read" if status == "N"
  end

  def self.update_description(book)
    puts "What is the new description for #{book.title}?"
    description = clean_gets
    book.update(description: description)
    puts "#{book.title} has been successfully updated!"
  end

  def self.update_title(book)
    puts "What would you like to change the title to?"
    title = clean_gets
    book.update(title: title)
    puts "#{book.title} has been successfully updated!"
  end

  def self.view(book)
    puts book.title
    puts "By:"
    book.authors.each do |author|
       puts author.name
    end
    puts "Genre:"
    book.genres.each do |genre|
      puts genre.name
    end
    puts "Description: #{book.description}"
    book.is_read == "Y" ? (puts "#{book.title} has been read") : (puts "#{book.title} has not been read")
  end
end
