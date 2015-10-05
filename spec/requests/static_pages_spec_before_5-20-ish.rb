require 'spec_helper'

describe "Static pages" do

  let (:base_title) {"Ruby on Rails Tutorial Sample App"}
  # The line above seemed to be deleted by the changes made in Listing 4.4
  
  # IMPORTANT :base_title IS IMPORTANT - I tried with :book_title & IT FAILED!!!
  #              
  #  ALSO - for this test to work, you need to use [can't remember]

  describe "Home page" do

    it "should have the h1 'Sample App'" do
      visit '/static_pages/home'
      page.should have_selector('h1', :text => 'Sample App')
    end
   
    it "should have the base title" do
     visit '/static_pages/home'
      page.should have_selector('title',
                        :text => "Ruby on Rails Tutorial Sample App")
    end
   
   
    it "should not have a custom page title" do
      visit '/static_pages/home'
      page.should_not have_selector('title', :text => '| Home')
    end
  end
  


  describe "Help page" do
    
    it "should have the h1 'Help'" do
      visit '/static_pages/help'
      page.should have_selector('h1', :text => 'Help') 
    end

    it "should have the base title" do
      visit '/static_pages/help'
      page.should have_selector('title', 
                        :text => "Ruby on Rails Tutorial Sample App") 
    end
    
    it "should not have a custom page title" do
      visit '/static_pages/help'
      page.should_not have_selector('title', :text=> '| Help')
    end
    
  end

  
  describe "About page" do
    
    it "should have the h1 'About Us'" do
      visit '/static_pages/about'
      page.should have_selector('h1', :text => 'About Us') 
    end

    it "should have the base title" do
      visit '/static_pages/about'
      page.should have_selector('title',
                    :text => "Ruby on Rails Tutorial Sample App")
    end
    
    it "should not have a custom page title" do
      visit '/static_pages/about'
      page.should_not have_selector('title', :text=> '| About')
    end
    # Lesson corner: IF the following line from About.html.erb :
    # <% provide(:title, 'About Us')%>
    #is placed in comments e.g. <!-- <% provide(:title, 'About Us')%> -->	
    # Then the test still fails! The code must be completely removed from the routine!
  end
  
  
  describe "Contact page" do
    
    it "should have the h1 'Contact'" do
      visit '/static_pages/contact'
      page.should have_selector('h1', text: 'Contact')
    end
        
    it "should have the title 'Contact'" do
      visit '/static_pages/contact'
      page.should have_selector('title', text: "Ruby on Rails Tutorial Sample App | Contact")
    end
  end
end
