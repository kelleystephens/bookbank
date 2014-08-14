class GenresController

  def self.add
    name = clean_gets
    if Genre.where(name: name).exists?
      Genre.where(name: name).first
    else
      Genre.create(name: name)
    end
  end

  def self.find_by_genre
    puts "What is the genre?"
    name = clean_gets
    genre = Genre.where(name: name).first
    if genre
      books = genre.books.all.order("title asc")
      books.each_with_index do |book, index|
        puts "#{index + 1}. #{book.title} by #{book.authors.first.name}"
      end
      BooksController.route("genre", name)
    else
      puts "Unable to find books with the genre #{name}, please try again"
      Router.find_book
    end
  end
end
