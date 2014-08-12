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
end
