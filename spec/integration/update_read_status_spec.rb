RSpec.describe "Update is_read", :integration do
  let!(:book){ run_bookbank_with_input("1", "Carrie", "stephen king", "Horror", "The Shining is a horror novel by American author Stephen King.", "n") }
  context "mark as read" do
    let!(:output){ run_bookbank_with_input("4", "Carrie", "Stephen King", "Y") }

    it "should save as read" do
      expect(Book.last.is_read).to include "Y"
    end
  end

  context "don't mark as read" do
    let!(:output){ run_bookbank_with_input("4", "Carrie", "Stephen King", "N") }

    it "should save as not read" do
      expect(Book.last.is_read).to include "N"
    end
  end

  context "success message printed" do
    let(:read){ run_bookbank_with_input("4", "Carrie", "Stephen King", "Y") }
    let(:not_read){ run_bookbank_with_input("4", "Carrie", "Stephen King", "n") }
    it "should print that the book has been marked as read" do
      expect(read).to include "Carrie has been marked as read"
    end

    it "should print that the book has been marked as not read" do
      expect(not_read).to include "Carrie has been marked as not read"
    end

  end
end
