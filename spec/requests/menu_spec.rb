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
end

