class AuthorsController

  def add
    name = clean_gets.split.map(&:capitalize).join(" ")
    Author.create(name: name)
  end
end
