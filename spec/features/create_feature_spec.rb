require 'rails_helper'

RSpec.describe "create page", type: :feature do
  include Devise::Test::IntegrationHelpers

  before :each do
    @user = User.create!(email: 'admin@colgate.edu', password: 'Colgate12', admin: true)
    sign_in @user
    visit dininghalls_path
  end

  it 'should not have a link to create a dining hall if user not signed in' do
    sign_out @user
    visit dininghalls_path
    expect(page).not_to have_content('New Dining Hall')
  end

  it 'should redirect to the index if the new route is accessed and user is not signed in' do
    sign_out @user
    visit new_dininghall_path
    expect(page.current_path).to eq(new_user_session_path)
  end

  it 'should successfully create a dining hall if a user is signed in' do
    click_on 'New Dining Hall'
    fill_in 'Name', with: 'Test Spec'
    fill_in 'Hours', with: '9-5'
    click_on 'Create Dining Hall'
    expect(page.current_path).to eq(dininghalls_path)
    expect(page).to have_content('Test Spec')
  end

  it 'should handle failure to create a dining hall gracefully' do
    click_on 'New Dining Hall'
    fill_in 'Name', with: 'Test Spec'
    fill_in 'Hours', with: '9-5'
    d = Dininghall.new
    expect(d).to receive(:save) { nil }
    allow(Dininghall).to receive(:new) { d }
    click_on 'Create Dining Hall'
    expect(page).to have_content('Dining hall could not be entered')
    expect(page.current_path).to eq(new_dininghall_path)
  end

  it 'should successfully create a menu' do
    click_on 'New Dining Hall'
    fill_in 'Name', with: 'Test Spec'
    fill_in 'Hours', with: '9-5'
    click_on 'Create Dining Hall'
    expect(page.current_path).to eq(dininghalls_path)
    expect(page).to have_content('Test Spec')
    click_on 'View Menus'
    click_on 'Create New Menu'
    fill_in 'Meal of day', with: 'Late night'
    click_on 'Create Menu'
    expect(page).to have_content('Late night')
  end

  it 'should handle failure to create a menu' do
    click_on 'New Dining Hall'
    fill_in 'Name', with: 'Test Spec'
    fill_in 'Hours', with: '9-5'
    click_on 'Create Dining Hall'
    expect(page.current_path).to eq(dininghalls_path)
    expect(page).to have_content('Test Spec')
    click_on 'View Menus'
    click_on 'Create New Menu'
    m = Menu.new
    expect(m).to receive(:save) { nil }
    allow(Menu).to receive(:new) { m }
    click_on 'Create Menu'
    expect(page).to have_content('Menu could not be entered')
    expect(page.current_path).to eq(new_menu_path)
  end  

  it 'should handle failure to create a menu item' do
    visit new_menu_item_path
    mi = MenuItem.new
    expect(mi).to receive(:save) { nil }
    allow(MenuItem).to receive(:new) { mi }
    click_on 'Create Menu Item'
    expect(page).to have_content('Menu Item could not be entered')
    expect(page.current_path).to eq(new_menu_item_path)
  end  

end