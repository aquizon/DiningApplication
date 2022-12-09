require 'rails_helper'

RSpec.describe Menu, type: :model do
  before (:each) do 
    @chicken = MenuItem.create(name: "Chicken Alfredo", description: "Fettucine pasta in a creamy sauce with grilled chicken", ingredients: "Chicken, Alfredo Sauce, Fettucine Pasta", calories: 400, allergens: "Dairy, Gluten", diet: "")
    @pancakes = MenuItem.create(name: "GF Pancakes", description: "Gluten free pancakes with butter and maple syrup", ingredients: "Rice Flour, Buttermilk, Oil, Maple Syrup, Butter", calories: 450, allergens: "Dairy", diet: "Vegetarian")
    @steak = MenuItem.create(name: "Steak", description: "Grilled Wagyu steak", ingredients: "Wagyu Beef, Salt, Black Pepper", calories: 350, allergens: "", diet: "")
    @vegs = MenuItem.create(name: "Vegetable Stir Fry", description: "Assorted vegetebles fried with rice", ingredients: "Carrots, Peas, Cabbage, Zucchini, Garlic, Onions, Rice", calories: 300, allergens: "Soy", diet: "Vegetarian, Vegan")
    @frank = Dininghall.create!(name: "Frank Dining Hall", hours: "7:30am - 12:00am")
    @frank.menus.create!(meal_of_day: "Breakfast", begin_time: Time.new(2022, 12,3, 13, 30, 0, "+09:00"), end_time: Time.new(2022, 12, 3, 16, 30, 0, "+09:00"))
    @frank.menus.find_by(meal_of_day: "Breakfast").menu_items = [@chicken, @pancakes, @steak, @vegs]
  end 

  context "sort_menu_by" do
    it "should correctly sort the menu by meal" do 
      expect(Menu.sort_items_by(@frank.id, []).length).to eq(4)
      expect(Menu.sort_items_by(@frank.id, ["vegan"]).length).to eq(1)
    end 

    it "should correctly filter dietary restrictions" do 
      expect(Menu.sort_items_by(@frank.id, ["dairy"]).length).to eq(2)
      expect(Menu.sort_items_by(@frank.id, ["dairy", "soy"]).length).to eq(1)
    end

    it "should correctly filter diets" do 
      expect(Menu.sort_items_by(@frank.id, ["vegan"]).length).to eq(1)
      expect(Menu.sort_items_by(@frank.id, ["vegetarian"]).length).to eq(2)
    end

    it "should correctly filter on multiple elements" do 
      expect(Menu.sort_items_by(@frank.id, ["soy"]).length).to eq(3)
      expect(Menu.sort_items_by(@frank.id, ["dairy"]).length).to eq(2)
      expect(Menu.sort_items_by(@frank.id, ["dairy", "vegan"]).length).to eq(1)
    end

  end

  context "other methods" do
    it "should correctly convert a time object to a readable string" do 
      time = Time.new(2022, 12,3, 13, 30, 0, "+09:00")
      menu = Menu.new
      expect(menu.get_time_str(time)).to eq("1:30 PM")
    end 
    it "should correctly return the dining hall name" do 
      expect(Menu.get_dininghall_name(1)).to eq("Frank Dining Hall")
    end 
    it "should correctly return the menu hours" do 
      menu = Menu.new(begin_time: Time.new(2022, 12,3, 13, 30, 0, "+09:00"), end_time: Time.new(2022, 12, 3, 16, 30, 0, "+09:00"), meal_of_day: "Breakfast")
      expect(menu.get_menu_hours).to eq("4:30 AM - 7:30 AM")
      menu = Menu.new(begin_time: Time.new(2022, 12,3, 13, 30, 0, "+09:00"), end_time: Time.new(2022, 12, 3, 16, 30, 0, "+09:00"))
      expect(menu.get_menu_hours).to eq("")
    end 
  end
end
