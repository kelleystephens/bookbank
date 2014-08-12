RSpec.describe "BookBank Main Menu", :integration do
  context "Prints a menu" do
    it "prints options" do
      actual = run_bookbank_with_input()
      expected = "What would you like to do?\n1. Add a new book\n2. Find a book\n3. Update a book\n4. Mark book as read"
      expect(actual).to include(expected)
    end
  end
  context "an incorrect command is entered" do
    let(:output){ run_bookbank_with_input('remove') }
    it "prints an error message" do
      expect(output).to include("I don't know the 'Remove' command.")
    end
  end

  context "a correct command is entered" do
    it "prints an informative message for option 1" do
      actual = run_bookbank_with_input("1", "Carrie", "Stephen King", "Horror", "Y")
      expected = "Let's add a book!"
      expect(actual).to include(expected)
    end
    it "prints an informative message for option 2" do
      actual = run_bookbank_with_input('2')
      expected = "Let's find a book!"
      expect(actual).to include(expected)
    end
    it "prints an informative message for option 3" do
      actual = run_bookbank_with_input('3')
      expected = "Let's update a book!"
      expect(actual).to include(expected)
    end
    it "prints an informative message for option 4" do
      run_bookbank_with_input("1", "Carrie", "Stephen King", "Horror", "n")
      actual = run_bookbank_with_input("4", "Carrie", "Stephen King", "Y")
      expected = "Let's mark a book as read!"
      expect(actual).to include(expected)
    end
  end
end
