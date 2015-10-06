# See BrainCell corner below for a vague explanation of what is happening.....

require 'spec_helper'

describe "Static pages" do
  
  subject { page }
  
  shared_examples_for "all static pages" do
    it { should have_selector('h1',    text: heading) }
    it { should have_selector('title', text: full_title(page_title)) }
  end
  
  describe "Home page" do
    before { visit root_path }
    let(:heading)    { 'Sample App' }
    let(:page_title) { '' }
    
    it_should_behave_like "all static pages"
    it { should_not have_selector 'title', text: '| Home' }
  end
  
  describe "Help Page" do
    before { visit help_path }
    let(:heading)    { 'Help' }
    let(:page_title) { 'Help' }
    it_should_behave_like "all static pages"
  end
  
  describe "About page" do
    before { visit about_path }    
    let(:heading)    { 'About' }
    let(:page_title) { 'About Us' }
    it_should_behave_like "all static pages"
  end

  describe "Contact page" do
    before { visit contact_path }    
    let(:heading)    { 'Contact' }
    let(:page_title) { 'Contact' }
    it_should_behave_like "all static pages"
  end
  
  # BrainCell corner:
  #
  # If you compare this $zn with static_pages_spec.rb I think what is going on is...
  #
  # you set the shared example tests at the top, then for root, help, about + contact
  # you repeat 2 tests each time with the command:
  # 'it_should_behave_like "all static pages"', the 2 lines proceeding this each time are
  # setting the local variables to use with the repeated test.
  # NOTE: on first run I was setting the vars but not including
  # 'it_should_behave_like "all static pages"'' below the 'Help' tests: this did not cause
  # a crash/fail, it merely set the local vars + then carried on + ended without upping
  # the number of tests run (bcos it had'nt done anymore)
  #
  
  it  "should have the right links on the layout" do
    visit root_path
    click_link "About"
    page.should have_selector 'title', text: full_title('About Us')
    
    click_link "Help"
    page.should have_selector 'title', text: full_title('Help')
    
    # You are here --> complete the rest of the tests (full_title value needs changing!!!!!)
    
    click_link "Contact"
    page.should have_selector 'title', text: full_title('Contact')

    click_link "Home"  
    # Note - you have to move back to "Home" before clicking on 'Sign up now!' bcos
    # this button only appears on the home page [whereas Help etc buttons/links are
    # visible on multiple pages] 
    click_link "Sign up now!"
    page.should have_selector 'title', text: full_title('Sign up') 

    click_link "sample app"
    page.should have_selector 'title', text: full_title('')

 
  end
end