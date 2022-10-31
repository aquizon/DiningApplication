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

Then('I should be on the show page for {string}') do |item|
    menu_item = Menu.find_by_name(item)
    expect(page.current_path).to eq(menu_path(menu_item.id))
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


Then('I should be on the Dininghall show page') do
  expect(page.current_path).to eq(dininghall_path)
end