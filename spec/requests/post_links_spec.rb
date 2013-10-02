require 'spec_helper'

#Michael would you test this?
feature "links displayed on main page" do 
  scenario "a user vists the home page" do 
    link = Link.create(url: 'http://www.google.com')
    visit root_path
    page.should have_content 'http://www.google.com'
  end
end 

feature "Post link" do
  scenario "a user successfully posts a link" do 
    visit root_path
    fill_in 'link_url', :with => 'http://www.google.com'
    click_button 'Submit'
    page.should have_content('successfully')
  end

  scenario "a user unsuccessfully posts a link" do 
    visit root_path
    fill_in 'link_url', :with => 'ww.error.com'
    click_button 'Submit'
    page.should have_content('not a valid')
  end
end

feature "Comment on a link" do
  scenario "a user successfully comments on a link" do
    link = Link.create(url: 'http://www.google.com')
    visit root_path
    click_link 'Comment'
    fill_in 'comment_content', :with => 'stupid link'
    click_button 'Post comment'
    page.should have_content('successfully')
  end

  scenario "a user unsuccessfully comments on a link" do
    link = Link.create(url: 'http://www.google.com')
    visit root_path
    click_link 'Comment'
    fill_in 'comment_content', :with => ''
    click_button 'Post comment'
    page.should have_content('blank')
  end
end 

feature "View comments" do
  # scenario "a user clicks 'View comments' for a particular link" do
  #   link = Link.create(url: 'http://www.google.com')
  #   visit root_path
  #   click_link 'Comment'
  #   fill_in 'comment_content', :with => 'stupid link'
  #   click_button 'Post comment'
  #   click_link 'View comments'
  #   page.should have_content('stupid link')
  # end
end

feature "Upvote a link" do
  scenario "a user clicks upvote on a link" do 
    link = Link.create(url: 'http://www.google.com')
    visit root_path
    click_link 'Upvote'
    page.should have_content('1')
  end

  # scenario "a user clicks upvote on a link" do 
  #   link = Link.create!(url: 'http://www.google.com')
  #   link2 = Link.create!(url: 'http://www.yahoo.com‎')
  #   visit root_path
  #   save_and_open_page
  #   click_link('#link-2')
  #   page.should have_tag("ul:first_child", :text => 'https://new.ycombinator.com/news')
  # end
end
