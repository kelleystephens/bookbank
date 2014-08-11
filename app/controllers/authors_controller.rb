class AuthorsController

  def add
    name = clean_gets
    Author.create(name: name)
  end
end
