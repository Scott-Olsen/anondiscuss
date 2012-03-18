require 'spec_helper'

describe "Static Pages" do

  let(:base_title) { "Anondisuss" }
  describe "Home page" do
    it "should have the h1 'Anondiscuss'" do
      visit '/static_pages/home'
      page.should have_selector('h1', :text => 'Anondiscuss')
    end

    it "should have the base title" do
      visit '/static_pages/home'
      page.should have_selector('title', :text => "Anondiscuss")
    end
  end

  describe "Help page" do
    it "should have the h1 'Help'" do
      visit '/static_pages/help'
      page.should have_selector('h1', :text => 'Help')
    end

    it "should have the title 'Help'" do
      visit '/static_pages/help'
      page.should have_selector('title', :text => "Anondiscuss | Help")
    end
  end

  describe "About page" do
    it "should have the h1 'About'" do
      visit '/static_pages/about'
      page.should have_selector('h1', :text => 'About')
    end
    it "should have the title 'About'" do
      visit '/static_pages/about'
      page.should have_selector('title', :text => "Anondiscuss | About")
    end
  end
end
