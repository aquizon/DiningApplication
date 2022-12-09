require 'rails_helper'

RSpec.describe "destroy", type: :feature do
  include Devise::Test::IntegrationHelpers

  before :each do
    @user = User.create!(email: 'admin@colgate.edu', password: 'Colgate12', admin: true)
    sign_in @user
    @dh = Dininghall.create!(name: "Test spec", hours: "7:30am - 12:00am")
  end

  it 'should successfully destroy a dining hall' do
    visit dininghalls_path
    expect(page.current_path).to eq(dininghalls_path)
    expect(page).to have_content('Test spec')
    click_on 'Test spec'
    expect(page).to have_content('Delete Dining Hall')
    click_on 'Delete Dining Hall'
    expect(page).to_not have_content('Test spec')
    expect(page).to have_content('Dining Hall removed successfully')
  end

  it 'should successfully destroy a menu' do
    visit dininghalls_path
    expect(page.current_path).to eq(dininghalls_path)
    expect(page).to have_content('Test spec')
    click_on 'Test spec'
    expect(page).to have_content('Delete Dining Hall')
    click_on 'Delete Dining Hall'
    expect(page).to_not have_content('Test spec')
    expect(page).to have_content('Dining Hall removed successfully')
  end

end