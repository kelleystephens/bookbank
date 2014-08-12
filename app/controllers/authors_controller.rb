class AuthorsController

  def add
    name = clean_gets
    if Author.where(name: "#{name}").exists?
      Author.where(name: "#{name}").first
    else
      Author.create(name: name)
    end
  end

  def find_by_author
    puts "What is the author's name?"
    name = clean_gets
    author = Author.where(name: "#{name}").first
    books = author.books.all.order("title asc") if author
    if books.length >= 1
      books.each_with_index do | book, index |
        puts "#{index + 1}. #{book.title}"
      end
    else
      puts "Unable to find books by #{name}, please try again"
      Router.find_by_author
    end
  end


end
