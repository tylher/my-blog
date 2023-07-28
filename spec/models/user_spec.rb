require "rails_helper"
RSpec.describe User, :type => :model do
  subject { described_class.new(name: "test") }
  it "is valid without attributes" do
    expect(subject).to be_valid
  end
  it "is not valid without name" do
    subject.name = nil
    expect(subject).not_to be_valid
  end
  it "is not valid without post_counter" do
    subject.posts_counter = nil
    expect(subject).to_not be_valid
  end
  it "is not valid with non numeric post_counter" do
    subject.posts_counter = "two"
    expect(subject).to_not be_valid
  end
  it "is not valid with negative post_counter" do
    subject.posts_counter = -2
    expect(subject).to_not be_valid
  end

  describe "Association" do
    it { should have_many(:posts) }
    it { should have_many(:comments) }
    it { should have_many(:likes) }
  end
end
