RSpec.describe "GET/ users", type: :feature do
    before(:all) do
         @user=User.create(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.',posts_counter: 0)
         @user1=User.create(name: 'Lilly', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Poland.', posts_counter: 0)
    end
    describe "user index" do
        it "description" do
      visit '/users'
      expect(page).to have_content(@user.name)
      expect(page).to have_content(@user1.name)
   end
   it "description" do
     visit '/' 
     expect(page.first("img[src='https://unsplash.com/photos/F_-0BxGuVvo']")['alt']).to have_content(@user.name)
     page.find('img[alt=Lilly]')
   end
   it "description" do
    visit '/'
    expect(page).to have_css('p', text:'Number of posts:', count:3)  
   end

   it "description" do
    visit '/'
    click_link @user.name
    expect(page).to have_content(@user.name)
    expect(page).to have_content(@user.bio)
   end
    end

    describe "show page" do
        it "description" do
            visit '/users/2'
        expect(page).to have_css("img[src='https://unsplash.com/photos/F_-0BxGuVvo']")
        end
        
        it "description" do
           visit '/users/2' 
           expect(page).to have_content(@user.name)
        end
        it "shows " do
           visit '/users/2' 
           expect(page).to have_content(@user.bio)
        end
        it "Shows number of posts" do
           visit '/users/2' 
           expect(page).to have_content(@user.posts_counter)
        end
        
    end
    
end
