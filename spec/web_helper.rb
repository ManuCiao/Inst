def sign_up
  visit('/')
  click_link('Sign up')
  fill_in 'user_username', with: 'test'
  fill_in('user_email', with: 'test@example.com')
  fill_in('user_password', with: 'testtest')
  fill_in('user_password_confirmation', with: 'testtest')
  click_button('Sign up')
end

def add_post(name, image)
  visit '/posts'
  click_link 'Add a post'
  fill_in 'post_name', with: name
  page.attach_file('post_image', Rails.root + "app/assets/images/#{image}")
  click_button 'Create Post'
end

def edit_post(name)
  click_link 'Edit'
  fill_in 'post_name', with: name
  click_button 'Update'
end

def add_comment(content)
  visit '/posts'
  click_link 'Comment'
  fill_in 'comment_content', with: content
  click_button 'Comment'
end

def post_with_tags(name=nil, tag)
  visit '/posts'
  click_link 'Add a post'
  fill_in 'post_name', with: name
  page.attach_file('post_image', Rails.root + "app/assets/images/#{image}")
  fill_in 'post_all_tags', with: tag
  click_button 'Create Post'
end
