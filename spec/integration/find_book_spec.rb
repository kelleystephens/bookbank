RSpec.describe "Find book(s)", :integration do
  let!(:output){ run_bookbank_with_input("2") }
  context "display options" do
    it "should show the different search options" do
      actual = "1. Find All\n2. Search by author\n3. Search by title\n4. Search by genre\n5. Search by is read status"
      expect(output).to include actual
    end
  end

  context "find by correct method selected" do
    let!(:book1){ run_bookbank_with_input("1", "Carrie", "Stephen King", "Horror", "The Shining is a horror novel by American author Stephen King.", "n") }
    let!(:book2){ run_bookbank_with_input("1", "Lean In", "Sheryl Sandberg", "Self Help", "Learship for women", "n") }
    let!(:book3){ run_bookbank_with_input("1", "An Untamed State", "Roxanne Gay", "Fiction", "the kidnapping of the daughter of a very rich man in Haiti.", "y") }
    let!(:book4){ run_bookbank_with_input("1", "The Shining", "Stephen King", "Fiction", "Family in hotel, dad goes crazy", "y") }
    it "should find and display all" do
      output = run_bookbank_with_input("2", "1")
      expect(output).to include "1. An Untamed State\n2. Carrie\n3. Lean In\n4. The Shining"
    end

    it "should search by the author" do
      output = run_bookbank_with_input("2", "2", "Stephen King")
      expect(output).to include "1. Carrie\n2. The Shining"
      expect(output).not_to include "1. An Untamed State\n2. Lean In"
    end

    it "should search by the title" do
      output = run_bookbank_with_input("2", "3", "Carrie")
      expect(output).to include "1. Carrie by Stephen King"
    end

    it "should search by the genre" do
      skip
      let!(:output){ run_bookbank_with_input("2", "4") }
    end

    it "should search by the is_read status" do
      skip
      let!(:output){ run_bookbank_with_input("2", "5") }
    end
  end
end
