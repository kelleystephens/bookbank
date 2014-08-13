RSpec.describe "View Book", :integration do
  let!(:book1){ run_bookbank_with_input("1", "Carrie", "Stephen King", "Horror", "Carrie is a horror novel by American author Stephen King.", "n") }
  let!(:book2){ run_bookbank_with_input("1", "Lean In", "Sheryl Sandberg", "Self Help", "Learship for women", "n") }
  let!(:book3){ run_bookbank_with_input("1", "Untamed State", "Roxanne Gay", "Fiction", "the kidnapping of the daughter of a very rich man in Haiti.", "y") }
  let!(:book4){ run_bookbank_with_input("1", "The Shining", "Stephen King", "Fiction", "Family in hotel, dad goes crazy", "y") }
  context "shows the details of the book selected for find_all list" do
    let!(:output){ run_bookbank_with_input("2", "1", "4") }
    it "should print book title" do
      expect(output).to include "Untamed State"
    end

    it "should print all authors" do
      expect(output).to include "Roxanne Gay"
    end

    it "should print all genres" do
      expect(output).to include "Fiction"
    end

    it "should print description" do
      expect(output).to include "The Kidnapping Of The Daughter Of A Very Rich Man In Haiti."
    end

    it "should print read/not read" do
      expect(output).to include "Untamed State has been read"
    end
  end

  context "shows the details of the book selected for find_by_author list" do
    let!(:output){ run_bookbank_with_input("2", "2", "stephen king", "2") }
    it "should print book title" do
      expect(output).to include "The Shining"
    end

    it "should print all authors" do
      expect(output).to include "Stephen King"
    end

    it "should print all genres" do
      expect(output).to include "Fiction"
    end

    it "should print description" do
      expect(output).to include "Family In Hotel, Dad Goes Crazy"
    end

    it "should print read/not read" do
      expect(output).to include "The Shining has been read"
    end
  end

  context "shows the details of the book selected for find_by_title list" do
    let!(:output){ run_bookbank_with_input("2", "3", "lean in", "1") }
    it "should print book title" do
      expect(output).to include "Lean In"
    end

    it "should print all authors" do
      expect(output).to include "Sheryl Sandberg"
    end

    it "should print all genres" do
      expect(output).to include "Self Help"
    end

    it "should print description" do
      expect(output).to include "Learship For Women"
    end

    it "should print read/not read" do
      expect(output).to include "Lean In has not been read"
    end
  end

  context "shows the details of the book selected for find_by_genre list" do
    let!(:output){ run_bookbank_with_input("2", "4", "fiction", "2") }
    it "should print book title" do
      expect(output).to include "Untamed State"
    end

    it "should print all authors" do
      expect(output).to include "Roxanne Gay"
    end

    it "should print all genres" do
      expect(output).to include "Fiction"
    end

    it "should print description" do
      expect(output).to include "The Kidnapping Of The Daughter Of A Very Rich Man In Haiti."
    end

    it "should print read/not read" do
      expect(output).to include "Untamed State has been read"
    end
  end

  context "shows the details of the book selected for find_by_is_read list" do
    let!(:output){ run_bookbank_with_input("2", "5", "unread", "1") }
    it "should print book title" do
      expect(output).to include "Carrie"
    end

    it "should print all authors" do
      expect(output).to include "Stephen King"
    end

    it "should print all genres" do
      expect(output).to include "Horror"
    end

    it "should print description" do
      expect(output).to include "Carrie Is A Horror Novel By American Author Stephen King."
    end

    it "should print read/not read" do
      expect(output).to include "Carrie has not been read"
    end
  end

  context "closes program if select DONE" do
    let!(:output){ run_bookbank_with_input("2", "1", "DONE") }
    it "should print thank you message" do
    end
  end

  context "error message if number selected is not in list" do
    let!(:output){ run_bookbank_with_input("2", "1", "12") }
    it "should say number is invalid" do
      expect(output).to include "Invalid selection"
    end
  end
end
