# require 'rails_helper'

# RSpec.describe "Menus", type: :request do
#   describe "GET /index" do
#     get new_menu_path
#     pending "add some examples (or delete) #{__FILE__}"
#   end
# end

require 'rails_helper'

RSpec.describe "menu control testing" do
    include Devise::Test::IntegrationHelpers
    
    it "returns http success" do
        get "/menus/1"
        expect(response).to have_http_status(302)
    end
end

RSpec.describe "menu items control testing" do
    menu1 = Menu.new(begin_time: Time.new(2022, 12,3, 13, 30, 0, "+09:00"), end_time: Time.new(2022, 12, 3, 16, 30, 0, "+09:00"), meal_of_day: "Breakfast")
    menu2 = Menu.new(begin_time: Time.new(2022, 12,3, 13, 30, 0, "+09:00"), end_time: Time.new(2022, 12, 3, 16, 30, 0, "+09:00"), meal_of_day: "Breakfast")

    it "GET /menu_items/new returns http success" do
        get new_menu_item_path
        expect(response).to have_http_status(302)
    end

    it "GET /menu_items: happy path redirects to index on successful create" do
        m = MenuItem.new
        expect(MenuItem).to receive(:new).and_return(m)
        expect(m).to receive(:save).and_return(true)
        post menu_items_path, params: {menu_item: {name: "test menu item"}}
        expect(response).to have_http_status(:redirect)
        expect(response).to redirect_to(menu_items_path)
    end

    it "GET /menu_items: sad path rerender the new book form an error" do
        m = MenuItem.new
        expect(MenuItem).to receive(:new).and_return(m)
        expect(m).to receive(:save).and_return(false)
        post menu_items_path, params: {menu_item: {name: "test menu item"}}
        expect(response).to have_http_status(:ok)
    end
end

