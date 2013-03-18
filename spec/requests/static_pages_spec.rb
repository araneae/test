require 'spec_helper'

describe "StaticPages" do
    
    subject { page }

  	describe "Home Page" do
  		before { visit root_path }

    	it { should have_selector('h3', text: 'Spider App') }
    	it { should have_content('Home') }
		it { should have_content('Help') }
		it { should have_content('Admin') }
  	end

  	describe "Help Page" do
  		before { visit help_path }

      	it { should have_selector('h2', text: 'Help') }
	end

	describe "About Page" do
		before { visit about_path }

      	it { should have_selector('h2', text: 'About') }
	end

	describe "Admin Page" do
		before { visit admin_path }

      	it { should have_selector('h2', text: 'Admin') }
	end

end
