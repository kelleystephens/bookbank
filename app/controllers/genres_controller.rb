class GenresController

  def add
    name = clean_gets
    Genre.create(name: name)
  end
end
