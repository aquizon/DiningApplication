Given(/^these MenuItems:$/) do |table| # table is a Cucumber::Ast::Table
    table.hashes.each do |h|
      Menu.create!(h)
    end
end

Given('I am on the MenusIndex page') do
    visit menus_path
end

When('I click on {string}') do |link|
    click_link(link)
end

Then('I should be on the Menu Item show page') do
    expect(page.current_path).to eq(menu_path)
end

Given('these Dininghalls:') do |table|
    # table is a Cucumber::MultilineArgument::DataTable
    table.hashes.each do |h|
        Dininghall.create!(h)
    end
end
  
Given('I am on the index page') do
  visit root
end
  
When('I click on {string}') do |link|
    click_link(link)
end

Then('I should be on the Dininghall show page') do
  expect(page.current_path).to eq(dininghall_path)
end