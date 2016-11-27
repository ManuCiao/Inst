require 'rails_helper'
require_relative '../web_helper'

feature 'tags' do

  before do
    sign_up
  end

  scenario 'users can tag on posts' do
    post_with_tags('#cute, #freak')
    expect(page).to have_link '#cute'
    expect(page).to have_link '#freak'
  end

   

end
