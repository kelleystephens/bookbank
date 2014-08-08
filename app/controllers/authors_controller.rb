class AuthorsController

  def add
    name = clean_gets
    f_name = name.split(" ")[0]
    l_name = name.split(" ")[1]
    Author.create(f_name: f_name, l_name: l_name)
  end
end
