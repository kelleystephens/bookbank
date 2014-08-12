RSpec.describe "Add a book", :integration do
  let!(:output){ run_bookbank_with_input("1", "Carrie", "stephen king", "Horror", "The Shining is a horror novel by American author Stephen King.", "Y") }
  context "create a book with a title" do
    it "should create a new book" do
      expect(Book.count).to eq 1
    end

    it "should have the correct title" do
      expect(Book.last.title).to eq "Carrie"
    end
  end

  context "create an author for the book" do
    it "should create a new author" do
      expect(Author.count).to eq 1
    end

    it "should have the correct name" do
      expect(Author.last.name).to eq "Stephen King"
    end

    it "should connect the author and the book" do
      expect(Book.last.authors).to eq [Author.last]
    end
  end

  context "add a genre to the book" do
    it "should create a new genre" do
      expect(Genre.count).to eq 1
    end

    it "should have the correct name" do
      expect(Genre.last.name).to eq "Horror"
    end

    it "should connect the genre and the book" do
      expect(Book.last.genres).to eq [Genre.last]
    end
  end

  context "update remaining book attributes" do
    it "should save the description" do
      expect(Book.last.description).to eq "The Shining Is A Horror Novel By American Author Stephen King."
    end

    it "should update the read status" do
      expect(Book.last.is_read).to eq "Y"
    end
  end

  context "print success message" do
    it "should print that the book was saved" do
      expect(output).to include "Carrie has been added to your library!"
    end
  end
end
