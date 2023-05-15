require 'rails_helper'

RSpec.describe 'Post pages test', type: :feature do
  describe 'index page' do
    before :each do
      @user_first = User.create(name: 'Tom', photo: 'tom.png', bio: 'I am Tom', post_counter: 0)

      @post_first = @user_first.posts.new(title: 'Niklaus', text: 'This is my first post')
      @post_first.likes_counter = 0
      @post_first.comments_counter = 0
      @post_first.save
      @post_first.update_users_posts_counter

      @comment = @user_first.comments.new(post_id: @post_first.id, author_id: @user_first.id, text: 'My first comment')
      @comment.post_id = @post_first.id
      @comment.save
      @comment.update_posts_comments_counter

      @like = Like.new(author_id: @user_first.id, post_id: @post_first.id)
      @like.author = @user_first
      @like.post = @post_first
      @like.save
      @like.update_posts_likes_counter
    end

    it 'Should set the link of the picture to the img src' do
      visit user_posts_path(@user_first.id)
      expect(page).to have_css("img[alt*='User Avatar']")
    end

    it 'Should display the user name' do
      visit user_posts_path(@user_first.id)
      expect(page).to have_content('Tom')
    end

    it 'Should display the total post number of 1' do
      visit user_posts_path(@user_first.id)
      expect(page).to have_content('Number of posts: 1')
    end

    it 'Should display the post body' do
      visit user_posts_path(@user_first.id)
      expect(page).to have_content('Tom')
    end

    it 'Should display the total post' do
      visit user_posts_path(@user_first.id)
      expect(page).to have_content('Number of posts: 1')
    end
  end

  describe 'show page' do
    before :each do
      @user_first = User.create(name: 'Tom', photo: 'Tom.png', bio: 'I am Tom', post_counter: 0)

      @post_first = @user_first.posts.new(title: 'Niklaus', text: 'This is my first post')
      @post_first.likes_counter = 0
      @post_first.comments_counter = 0
      @post_first.update_users_posts_counter
      @post_first.save

      @comment = @user_first.comments.new(post_id: @post_first.id, author_id: @user_first.id, text: 'My first comment')
      @comment.post_id = @post_first.id
      @comment.update_posts_comments_counter
      @comment.save

      @like = Like.new(author_id: @user_first.id, post_id: @post_first.id)
      @like.author = @user_first
      @like.post = @post_first
      @like.save
      @like.update_posts_likes_counter
    end

    it 'Should display the post title' do
      visit user_post_path(@user_first.id, @post_first.id)
      expect(page).to have_content('Create new comment')
    end

    it 'Should display who wrote the post' do
      visit user_post_path(@user_first.id, @post_first.id)
      expect(page).to have_content('Tom')
    end

    it 'Should display the total post comment number of 1' do
      visit user_post_path(@user_first.id, @post_first.id)
      expect(page).to have_content('Comments: 1')
    end

    it 'Should display the total post likes number of 1' do
      visit user_post_path(@user_first.id, @post_first.id)
      expect(page).to have_content('Likes: 1')
    end

    it 'Should display the post body' do
      visit user_post_path(@user_first.id, @post_first.id)
      expect(page).to have_content('This is my first post')
    end

    it 'Should display the name of the user who posted a comment' do
      visit user_post_path(@user_first.id, @post_first.id)
      expect(page).to have_content('Tom:')
    end

    it 'Should display the post comment text of a user' do
      visit user_post_path(@user_first.id, @post_first.id)
      expect(page).to have_content('My first comment')
    end
  end
end
