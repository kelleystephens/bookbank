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
    books_controller = BooksController.new()
    books_controller.add
    authors_controller = AuthorsController.new()
    authors_controller.add
    # puts "What is the title?"
    # title = clean_gets
    # puts "What is the author?"
    # author = clean_gets
    # f_name = author.split(" ")[0]
    # l_name = author.split(" ")[1]
    # Author.create(f_name: f_name, l_name: l_name)
    # Book.create(title: title)
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
