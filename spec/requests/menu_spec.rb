# require 'rails_helper'

# RSpec.describe "Menus", type: :request do
#   describe "GET /index" do
#     get new_menu_path
#     pending "add some examples (or delete) #{__FILE__}"
#   end
# end

require 'rails_helper'

RSpec.describe "GET /menu_items/new" do
    it "returns http success" do
        get new_menu_item_path
        expect(response).to have http_status(:success)
    end
end

RSpec.describe "GET /menu_items: happy path" do
    it "redirects to index on successful create" do
        m = MenuItem.new
        expect(MenuItem).to receive(:new).and_return(m)
        expect(m).to receive(:save).and_return(true)
        post menu_items_path, params: {menu_item: {name: "test menu item"}}
        expect(response).to have_http_status(:redirect)
        expect(response).to redirect_to(menu_items_path)
    end
end

RSpec.describe "GET /menu_items: sad path" do
    it "rerender the new book form an error" do
        m = MenuItem.new
        expect(MenuItem).to receive(:new).and_return(m)
        expect(m).to receive(:save).and_return(false)
        post menu_items_path, params: {menu_item: {name: "test menu item"}}
        expect(response).to have_http_status(:ok)
    end
end

