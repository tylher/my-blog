require 'rails_helper'

RSpec.describe User, type: :model do
  subject { User.new(name: 'taiwo') }
  before{subject.save}

  it "name should be present" do
    subject.name = nil
    expect(subject).to_not be_valid
  end
  it "posts_counts should be an integer" do
    subject.posts_counter = 0
    expect(subject).to be_valid
  end
  
end
