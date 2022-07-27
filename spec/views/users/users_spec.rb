RSpec.describe "GET/ users", type: :feature do
    before(:all) do
         @user=User.create(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.',posts_counter: 0)
         @user1=User.create(name: 'Lilly', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Poland.', posts_counter: 0)

         @post1=Post.create(title:'power above all', text:'we are all pencils in the hand of the creator',author:@user )
         @post2=Post.create(title:'Buisness', text:'Never being lazy',author:@user )
         @post2.update_post_count
    end
    describe "user index" do
        it "description" do
      visit '/users'
      expect(page).to have_content(@user.name)
      expect(page).to have_content(@user1.name)
   end
   it "description" do
     visit '/' 
     expect(page).to have_css('img[alt=Tom]')
     expect(page).to have_css('img[alt=Lilly]')

   end
   it "description" do
    visit '/'
    expect(page).to have_css('p', text:'Number of posts: 2') 
    expect(page).to have_css('p', text:'Number of posts: 0') 
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
            visit "/users/#{@user.id}"
        expect(page).to have_css("img[src='https://unsplash.com/photos/F_-0BxGuVvo']")
        end
        
        it "description" do
           visit "/users/#{@user.id}" 
           expect(page).to have_content(@user.name)
        end
        it "shows user's bio" do
           visit "/users/#{@user.id}"  
           expect(page).to have_content(@user.bio)
        end
        it "Shows number of posts" do
           visit "/users/#{@user.id}" 
           expect(page).to have_content('Number of posts: 2')
        end
        
    end
    
end
