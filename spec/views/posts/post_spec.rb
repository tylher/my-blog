RSpec.describe 'GET/ post', type: :feature do
    before(:all) do
    @user1 = User.create(name: 'Tom',photo: 'https://rb.gy/lo3mjf', bio: 'Teacher from Mexico.', posts_counter: 0)
    @user2 = User.create(name: 'Lilly',photo: 'https://rb.gy/iznb4r', bio: 'Teacher from Poland.', posts_counter: 0)
    @post1 = Post.create(author: @user1,title:'Post 1',text:'Post 1 text',comments_counter: 0,likes_counter:0)
    @post2 = Post.create(author: @user1,title:'Post 2',text:'Post 2 text',comments_counter: 0,likes_counter:0)
    @post3 = Post.create(author: @user1,title:'Post 3',text:'Post 3 text',comments_counter: 0,likes_counter:0)
    @comments1 = Comment.create(author: @user2,post: @post1,text: 'Comment 1 text')
    @comments2 = Comment.create(author: @user2,post: @post2,text: 'Comment 2 text')
    @comments3 = Comment.create(author: @user2,post: @post3,text: 'Comment 3 text')
    end
    describe "Post show page" do
        it "Page shows post's title" do
            visit user_post_path(user_id: 1,id:1)
            expect(page).to have_content(@post1.title)  
        end
        it "Page shows post's author" do
            visit user_post_path(user_id: 1,id:1)
            expect(page).to have_content(@post1.author.name)  
        end
        it "Page shows post's number of comments" do
            visit user_post_path(user_id: 1,id:1)
            expect(page).to have_content(@post1.comments_counter)  
        end
        it "Page shows post's number of likes" do
            visit user_post_path(user_id: 1,id:1)
            expect(page).to have_content(@post1.likes_counter)  
        end
        it "Page shows post's body" do
            visit user_post_path(user_id: 1,id:1)
            expect(page).to have_content(@post1.text)  
        end
       
       it "shows names of all commenters" do
           visit user_post_path(user_id: 1,id:1)
           expect(page).to have_content(@comments1.author.name)   
       end

       it "shows names of all commenters" do
           visit user_post_path(user_id: 1,id:1)
           expect(page).to have_content(@comments1.text)   
       end
       
        
    end
    
end