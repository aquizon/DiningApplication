Given('these Items:') do |table|
    table.hashes.each do |h| 
        Menu.create!(h)
    end
  end
  
Then('I should be on the new menu item page') do
   expect(page.current_path).to eq(new_menu_path)
end
  
Then('I should be on the menu index page') do
    expect(page.current_path).to eq(menus_path)
end

Then('I should see {string}') do |string| 
    expect(page).to have_content(string)
end 

Given('I am on the menu index page') do 
    visit menus_path
end

Then('I should not see {string}') do |string| 
    expect(page).not_to have_content(string)
end 

When('I press {string}') do |link| 
    click_on link
end


When('I fill in the following:') do |table| 
    table.hashes.each do |form|
        fill_in(form['Field'], with: form['Value'])
    end
end 

Then('I should see that {string} is made of {string}') do |name, ingr|
    items = all('td.name')
    ingredients = ''
    items.each_with_index do |td, idx|
        ingredients = all('td.name')[idx].text if td.text == name
    end

    expect(ingredients).to eq(ingr)


end
