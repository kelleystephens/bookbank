class AuthorsController

  def add
    name = clean_gets
    if Author.where(name: name).exists?
      Author.where(name: name).first
    else
      Author.create(name: name)
    end
  end

  def find_by_author
    puts "What is the author's name?"
    name = clean_gets
    author = Author.where(name: name).first
    if author
      books = author.books.all.order("title asc")
      books.each_with_index do | book, index |
        puts "#{index + 1}. #{book.title}"
      end
      books_controller = BooksController.new()
      books_controller.route("author", name)
    else
      puts "Unable to find books by #{name}, please try again"
      Router.find_book
    end
  end

  def update_author_name
    puts "Who would you like to update?"
    name = clean_gets
    author = Author.where(name: name).first
    if author
      puts "What would you like to change #{author.name}'s' name to?"
      new_name = clean_gets
      author.update(name: new_name)
      puts "#{author.name} has been updated!"
    else
      puts "No author #{name}"
      Router.edit_book
    end
  end

end
