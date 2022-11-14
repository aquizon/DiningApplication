require 'rails_helper'

RSpec.describe "create page", type: :feature do
  include Devise::Test::IntegrationHelpers

  before :each do
    @user = User.create!(email: 'admin@colgate.edu', password: 'Colgate12', admin: true)
    sign_in @user
    visit dininghalls_path
  end

  it 'should not have a link to create a product if user not signed in' do
    sign_out @user
    visit dininghalls_path
    expect(page).not_to have_content('New Dining Hall')
  end

  it 'should redirect to the index if the new route is accessed and user is not signed in' do
    sign_out @user
    visit new_dininghall_path
    expect(page.current_path).to eq(new_user_session_path)
  end

  it 'should successfully create a product if a user is signed in' do
    click_on 'New Dining Hall'
    fill_in 'Name', with: 'Test Spec'
    fill_in 'Hours', with: '9-5'
    click_on 'Create Dining Hall'
    expect(page.current_path).to eq(dininghalls_path)
    expect(page).to have_content('Test Spec')
  end

  # it 'should handle failure to create a product gracefully' do
  #   click_on 'New Dining Hall'
  #   fill_in 'Name', with: 'Test Spec'
  #   fill_in 'Hours', with: '9-5'
  #   d = Dininghall.new
  #   expect(d).to receive(:save) { nil }
  #   allow(Dininghall).to receive(:new) { d }
  #   click_on 'New Dining Hall'
  #   expect(page.current_path).to eq(new_dininghall_path)
  #   expect(page).to have_content('Failed to save dining hall')
  # end
end