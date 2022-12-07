require 'rails_helper'

RSpec.feature "Google Auth", type: :feature do
  describe "Google authentication" do
    it "should have a link to login via google" do
      visit dininghalls_path
      link = page.find('form[action="/users/auth/google_oauth2"]')
      expect(link.text).to match(/google/i)
    end

    it "should have the right routes" do      
      expect(user_google_oauth2_omniauth_authorize_path).to eq('/users/auth/google_oauth2')
      expect(user_google_oauth2_omniauth_callback_path).to eq('/users/auth/google_oauth2/callback')
    end

    it "should have the right initializer setup for devise" do
      contents = File.read('./config/initializers/devise.rb')
      idx = contents =~ /config\.omniauth :google/
      expect(contents[idx..]).to match(/^config\.omniauth\s+:google/)

      # config.omniauth :github, ENV['GITHUB_APP_ID'], ENV['GITHUB_APP_SECRET'], scope: 'user,public_repo' 
    end

    it "should have the correct users controller code" do
      expect(Dir.exist?('app/controllers/users')).to be true
      expect(File.exist?('app/controllers/users/omniauth_callbacks_controller.rb')).to be true
    end
  end
end