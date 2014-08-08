RSpec.describe Book do
  context "validations" do
    it { should have_many(:authors).through(:authorships) }
    it { should have_many(:genres).through(:book_genres) }
    it { should ensure_length_of(:title).
          is_at_most(30).
          with_message("must be less than 30 characters")}
    it { should validate_presence_of :title }
  end
end
