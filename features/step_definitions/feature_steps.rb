Given(/^these MenuItems:$/) do |table| # table is a Cucumber::Ast::Table
  table.hashes.each do |h|
    MenuItem.create!(h)
  end
end

Given('I am on the MenusIndex page') do
  visit menu_items_path
end

When('I click on {string}') do |link|
  click_link(link)
end

Then('I should be on the show page for {string}') do |item|
    menu_item = MenuItem.find_by_name(item)
    expect(page.current_path).to eq(menu_item_path(menu_item.id))

end

Given('these Dininghalls:') do |table|
  # table is a Cucumber::MultilineArgument::DataTable
  table.hashes.each do |h|
    Dininghall.create!(h)
  end
end

Given('I am on the index page') do
  visit root_path
end

Then('I should be on the show dining hall page for {string}') do |item|
    dining_hall = Dininghall.find_by_name(item)
    expect(page.current_path).to eq(dininghall_path(dining_hall.id))
  end


Then('I should be on the show menu item page for {string}') do |item|
  menu_item = MenuItem.find_by_name(item)
  expect(page.current_path).to eq(menu_item_path(menu_item.id))
end

Then('I should be on the edit menu item page for {string}') do |item|
  menu_item = MenuItem.find_by_name(item)
  expect(page.current_path).to eq(edit_menu_item_path(menu_item.id))
end

When('I change the {string} to {string}') do |field, value|
  # debugger
  fill_in(field, with: value)
end

When('I fill in the following:') do |table|
    table.hashes.each do |form|
      fill_in(form['Field'], with: form['Value'])
    end
  end

  Then('I should be on the new dining hall page') do
    expect(page.current_path).to eq(new_dininghall_path)
  end
  
  Then('I should be on the index page') do
    expect(page.current_path).to eq(root_path).or eq('/dininghalls')

  end
  
  Then('I should be on the edit dining hall page for {string}') do |string|
    dining_hall = Dininghall.find_by_name(string)
    expect(page.current_path).to eq(edit_dininghall_path(dining_hall.id))
  end
  Then('I should be on the {string} page') do |string|
    dining_hall = Dininghall.find_by_name(string)
    expect(page.current_path).to eq(dininghall_path(dining_hall.id))
  end

  Given('these Users:') do |table|
    table.hashes.each do |h|
      u = User.new(h)
      u.save
    end
  end

  When('I login as {string} and {string}') do |string, string2|
    fill_in 'Email', with: string
    fill_in 'Password', with: string2
    click_on 'Log in'
  end

  Given('I am on the new dining hall page') do
    visit new_dininghall_path
  end

  Given('I am on the the show menu item page for {string}') do |string|
    menu_item = MenuItem.find_by_name(string)
    visit menu_item_path(menu_item.id)
  end

  When('I select checkbox {string}') do |cb|
    check(cb)
  end

  Given('I am on the dininghalls index page') do
    visit dininghalls_path
  end
  
  Given('I am on the menu index page for {string}') do |string|
    dh = Dininghall.find_by_name(string)
    @dh = dh
    visit menus_path(:dh_id => dh.id)
  end
  
  Then('I should be on the new menu page') do
    visit new_menu_path
    expect(page.current_path).to eq(new_menu_path)
  end

  When('I put in {string} for {string}') do |value, field|
    fill_in(field, with: value)
  end
  
  Then('I should be on the menu show page for {string}') do |string|
    m = Menu.find_by "meal_of_day = ?", string
    expect(page.current_path).to eq(menu_path(m.id))
  end
  