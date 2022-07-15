require 'rails_helper'

RSpec.describe Post, type: :model do
    subject {Post.new(author: User.new(name: "Wale",posts_counter: 0),title: "Work in progress")}
    before {subject.save}

    it "title should not be blank" do
        subject.title = nil
        expect(subject).to be_valid
    end
    
end
