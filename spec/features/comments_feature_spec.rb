require 'rails_helper'
require_relative '../web_helper'

feature 'comments' do

  before do
    sign_up
    add_post('Nice Picture', 'post.png')
  end

  scenario 'users can comment on posts' do
      add_comment('Look at this nice picture')
      expect(current_path).to eq posts_path
      expect(page).to have_content 'Look at this nice picture'
  end

end
