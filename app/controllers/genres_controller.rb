class GenresController

  def add
    name = clean_gets
    if Genre.where(name: "#{name}").exists?
      Genre.where(name: "#{name}").first
    else
      Genre.create(name: name)
    end
  end
end
