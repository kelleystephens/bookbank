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

  def find_all
    books = Book.all.order("title asc")
    if books.length >=1
      books.each_with_index do | book, index |
        puts "#{index + 1}. #{book.title}"
      end
    else
      puts "Sorry, no books were found"
    end
  end

  def find_book(title, author_name)
    author = Author.where(name: "#{author_name}").first
    if author
      author.books.where(title: "#{title}").first
    else
      puts "Unable to find book, please try again"
      Router.update_read_status
    end
  end

  def find_by_is_read
    puts "Search books that are: Read or Unread?"
    status = clean_gets
    status == "Read" ? status = "Y" : status = "N"
    books = Book.where(is_read: status).all
    if books.length >=1
      books.each_with_index do |book, index|
        puts "#{index + 1}. #{book.title} by #{book.authors.first.name}"
      end
    else
      puts "Unable to find books that are #{status}, please try again"
      Router.find_book
    end
  end

  def find_by_title
    title = clean_gets
    books = Book.where(title: "#{title}").all
    if books.length >= 1
      books.each_with_index do |book, index|
        puts "#{index + 1}. #{book.title} by #{book.authors.first.name}"
      end
    else
      puts "Unable to find books with the title #{title}, please try again"
      Router.find_book
    end
  end

  def is_read?
    answer = clean_gets
    book = Book.last
    book.is_read = answer
    book.save
  end

  def update_is_read(book)
    book_name = book.title
    status = clean_gets
    book.update(is_read: "#{status}")
    puts "#{book_name} has been marked as read" if status == "Y"
    puts "#{book_name} has been marked as not read" if status == "N"
  end

  def update_description(book)
    puts "What is the new description for #{book.title}?"
    description = clean_gets
    book.update(description: description)
    puts "#{book.title} has been successfully updated!"
  end

  def update_title(book)
    puts "What would you like to change the title to?"
    title = clean_gets
    book.update(title: title)
    puts "#{book.title} has been successfully updated!"
  end
end
