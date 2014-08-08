class BooksController

  def add
    title = clean_gets
    Book.create(title: title)
  end
end
