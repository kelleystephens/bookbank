RSpec.describe "Add a book", :integration do
  context "create a book with a title" do
    let!(:output){ run_bookbank_with_input("1", "Carrie") }
    it "should create a new book" do
      expect(Book.count).to eq 1
    end

    it "should have the correct title" do
      expect(Book.last.title).to eq "Carrie"
    end
  end

  context "create an author for the book" do
    let!(:output){ run_bookbank_with_input("1", "Carrie", "Stephen King") }
    it "should create a new author" do
      expect(Author.count).to eq 1
    end

    it "should have the correct name" do
      expect(Author.last.f_name).to eq "Stephen"
      expect(Author.last.l_name).to eq "King"
    end
  end
end
