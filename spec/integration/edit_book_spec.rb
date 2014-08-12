RSpec.describe "Update Book", :integration do
  let!(:book){ run_bookbank_with_input("1", "Carrie", "stephen king", "Horror", "The Shining is a horror novel by American author Stephen King.", "n") }
  context "prints menu" do
    it "should print the options to update" do
      actual = run_bookbank_with_input("3", "foo")
      expected = "What would you like to update?\n1. A book's title\n2. A book's description\n3. An author's name\n4. Add another genre to a book\n5. Add another author to a book"
      expect(actual).to include(expected)
    end
  end
  context "update book title" do
    let!(:output){ run_bookbank_with_input("3", "1", "carrie", "stephen king", "the shining") }
    it "should save new title" do
      expect(Book.last.title).to include "The Shining"
    end

    it "should not have old title" do
      expect(Book.last.title).not_to include "Carrie"
    end
  end

  context "update book description" do
    let!(:output){ run_bookbank_with_input("3", "2", "carrie", "stephen king", "A family stuck in a hotel. Dad goes crazy") }
    it "should save new description" do
      expect(Book.last.description).to include "A Family Stuck In A Hotel. Dad Goes Crazy"
    end

    it "should not have old title" do
      expect(Book.last.title).not_to include "The Shining Is A Horror Novel By American Author Stephen King."
    end
  end

  context "update author name" do
    it "should save new name" do
      run_bookbank_with_input("3", "3", "stephen king", "s. king")
      expect(Author.last.name).to include "S. King"
    end

    it "should not have old name" do
      run_bookbank_with_input("3", "3", "stephen king", "s. king")
      expect(Author.last.name).not_to include "Stephen King"
    end

    it "should give error message if name not in database" do
      output = run_bookbank_with_input("3", "3", "foo")
      expect(output).to include "No author Foo"
    end
  end

  context "add additional genre to book" do
    let!(:output){ run_bookbank_with_input("3", "4", "carrie", "stephen king", "fiction") }
    it "should add another genre to book" do
      expect(Genre.last.name).to include "Fiction"
      expect(Book.last.genres.last).to eq Genre.last
    end

    it "should not replace the current genre" do
      expect(Book.last.genres.all.length).to eq 2
    end
  end

  context "add additional authors to book" do
    let!(:output){ run_bookbank_with_input("3", "5", "carrie", "stephen king", "jane smith") }
    it "should add another author to book" do
      expect(Author.last.name).to include "Jane Smith"
      expect(Book.last.authors.last).to eq Author.last
    end

    it "should not replace the current genre" do
      expect(Book.last.authors.all.length).to eq 2
    end
  end
end
