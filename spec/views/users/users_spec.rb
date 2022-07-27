RSpec.describe 'GET/ users', type: :feature do
  before(:all) do
    @user1 = User.first
    @user2 = User.second
    @post1 = Post.first
    @post2 = Post.second
    @post3 = Post.find(3)
    @comments1 = Comment.first
    @comments2 = Comment.second
    @comments3 = Comment.find(3)
  end

  describe "Users index page '/users'" do
    it 'Should show all users username' do
      visit '/users'
      sleep(2)
      expect(page).to have_content('Tom')
      expect(page).to have_content('Lilly')
    end

    it 'Should show profile image of each user' do
      visit '/users'
      sleep(2)
      expect(page).to have_css("img[src*='https://rb.gy/lo3mjf']")
      expect(page).to have_css("img[src*='https://rb.gy/iznb4r']")
    end

    it 'Should show number of posts each user has wrote' do
      visit '/users'
      sleep(2)
      expect(page).to have_content('Number of posts: 0')
      expect(page).to have_content('Number of posts: 0')
    end

    it 'Should redirect to users profile page when user clicks on username' do
      visit '/users'
      sleep(2)
      click_link('Tom')
      expect(page.current_path).to eq('/users/1')
    end
  end

  describe "User show page 'users/user_id'"
  it 'should show user image' do
    visit '/users/1'
    sleep(2)
    expect(page).to have_css("img[src*='https://rb.gy/lo3mjf']")
  end

  it 'should show user name' do
    visit '/users/1'
    sleep(2)
    expect(page).to have_content('Tom')
  end

  it 'should show user bio' do
    visit '/users/1'
    sleep(2)
    expect(page).to have_content('Teacher from Mexico.')
  end

  it 'should show user number of posts' do
    visit '/users/1'
    sleep(2)
    expect(page).to have_content('Number of posts: 3')
  end

  it 'should show users most recent three post' do
    visit '/users/1'
    sleep(2)
    expect(page).to have_content('Post 1')
    expect(page).to have_content('Post 2')
    expect(page).to have_content('Post 3')
  end

  it 'should show a see all posts button' do
    visit '/users/1'
    sleep(2)
    expect(page).to have_content('See all posts')
  end

  it 'should redirect to all posts page when user clicks on see all posts button' do
    visit '/users/1'
    sleep(2)
    click_link('See all posts')
    expect(page.current_path).to eq('/users/1/posts')
  end

  it 'should redirect to posts show page when user clicks on post title' do
    visit '/users/1'
    sleep(2)
    click_link('Post 1')
    expect(page.current_path).to eq('/users/1/posts/1')
  end

  describe "User post index page '/users/user_id/posts'" do
    it 'should show profile image of user' do
      visit '/users/1/posts'
      sleep(2)
      expect(page).to have_css("img[src*='https://rb.gy/lo3mjf']")
    end

    it 'should show user name' do
      visit '/users/1/posts'
      sleep(2)
      expect(page).to have_content('Tom')
    end

    it 'should show the number of posts the user has wrote' do
      visit '/users/1/posts'
      sleep(2)
      expect(page).to have_content('Number of posts: 3')
    end

    it 'should show the title of each post' do
      visit '/users/1/posts'
      sleep(2)
      expect(page).to have_content('Post 1')
      expect(page).to have_content('Post 2')
      expect(page).to have_content('Post 3')
    end

    it 'should show the text of each post' do
      visit '/users/1/posts'
      sleep(2)
      expect(page).to have_content('Post 1 text')
      expect(page).to have_content('Post 2 text')
      expect(page).to have_content('Post 3 text')
    end

    it 'should show the first comment of each post' do
      visit '/users/1/posts'
      sleep(2)
      expect(page).to have_content('Comment 1 text')
      expect(page).to have_content('Comment 2 text')
      expect(page).to have_content('Comment 3 text')
    end

    it 'should show a paggination button' do
      visit '/users/1/posts'
      sleep(2)
      expect(page).to have_content('Paggination')
    end
  end
end
