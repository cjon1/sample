require 'spec_helper'

describe "User pages" do

  subject { page }
  
  describe "signup page" do
    before  { visit signup_path }
	
	  it { should have_selector('h1',    text: 'Sign up') }
	  it { should have_selector('title', text: full_title('Sign up')) }
    #Careful there now: don't put a space between "have_selector" and "(" or test blows up
    #but doesn't tell you what the problem is!!
	end
end


