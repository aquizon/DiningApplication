Given('these Items:') do |table|
  table.hashes.each do |h|
    MenuItem.create!(h)
  end
end

Then('I should be on the new menu item page') do
  expect(page.current_path).to eq(new_menu_item_path)
end

Then('I should be on the menu index page') do
  expect(page.current_path).to eq(menu_items_path)
end

Then('I should see {string}') do |string|
  expect(page).to have_content(string)
end

Given('I am on the menu index page') do
  visit menu_items_path
end

Then('I should not see {string}') do |string|
  expect(page).not_to have_content(string)
end

When('I press {string}') do |link|
  click_on link
end

Then('I should see that {string} is made of {string}') do |name, ingr|
  items = all('td.name')
  ingredients = ''
  items.each_with_index do |td, idx|
    ingredients = all('td.name')[idx].text if td.text == name
  end

  expect(ingredients).to eq(ingr)
end

Given('I am on the new menu item page') do
  visit new_menu_item_path
end