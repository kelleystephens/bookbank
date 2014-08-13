RSpec.describe "Delete Book", :integration do
  let!(:book1){ run_bookbank_with_input("1", "Carrie", "Stephen King", "Horror", "Carrie is a horror novel by American author Stephen King.", "n") }
  let!(:book2){ run_bookbank_with_input("1", "Lean In", "Sheryl Sandberg", "Self Help", "Learship for women", "n") }
  let!(:book3){ run_bookbank_with_input("1", "Untamed State", "Roxanne Gay", "Fiction", "the kidnapping of the daughter of a very rich man in Haiti.", "y") }
  let!(:book4){ run_bookbank_with_input("1", "The Shining", "Stephen King", "Fiction", "Family in hotel, dad goes crazy", "y") }
  context "deletes the selected book" do
    let!(:output){ run_bookbank_with_input("5", "Lean In", "Sheryl Sandberg") }
    it "should delete book" do
      expect(Book.count).to eq 3
    end
  end
end
