require 'rails_helper'

RSpec.describe "create page", type: :feature do
  include Devise::Test::IntegrationHelpers

  before :each do
    @user = User.create!(email: 'admin@colgate.edu', password: 'testtest', admin: true)
    sign_in @user
    visit products_path
  end

  it 'should not have a link to create a product if user not signed in' do
    sign_out @user
    visit products_path
    expect(page).not_to have_content('Create new toy')
  end

  it 'should redirect to the index if the new route is accessed and user is not signed in' do
    sign_out @user
    visit new_product_path
    expect(page.current_path).to eq(new_user_session_path)
  end

  it 'should successfully create a product if a user is signed in' do
    click_on 'Create new toy'
    fill_in 'Name', with: 'Test toy'
    fill_in 'Description', with: 'Test toy description'
    fill_in 'Price', with: 9.99
    fill_in 'Minimum age appropriate', with: 1
    fill_in 'Maximum age appropriate', with: 10
    fill_in 'Release year', with: 2000
    click_on 'Create new toy'
    expect(page.current_path).to eq(products_path)
    expect(page).to have_content('Test toy')
  end

  it 'should handle failure to create a product gracefully' do
    click_on 'Create new toy'
    fill_in 'Name', with: 'Test toy'
    fill_in 'Description', with: 'Test toy description'
    fill_in 'Price', with: 9.99
    fill_in 'Minimum age appropriate', with: 1
    fill_in 'Maximum age appropriate', with: 10
    fill_in 'Release year', with: 2000
    p = Product.new
    expect(p).to receive(:save) { nil }
    allow(Product).to receive(:new) { p }
    click_on 'Create new toy'
    expect(page.current_path).to eq(new_product_path)
    expect(page).to have_content('Failed to save new toy')
  end
end