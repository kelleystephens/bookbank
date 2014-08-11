RSpec.describe Genre do
  context "validations" do
    it { should have_many(:books).through(:book_genres) }
    it { should ensure_length_of(:name).
          is_at_most(30).
          with_message("must be less than 30 characters")}
    it { should validate_presence_of :name}
    it { should validate_uniqueness_of :name}
  end

  context "validating format" do
    let!(:genre){ Genre.create(name: "123") }

    it "should have an appropriate error message" do
      expect(genre.errors.full_messages_for(:name)
            ).to include("Name must include letters")
    end
    it "shouldn't save the new record" do
      expect(Genre.count).to eq 0
    end
  end
end
