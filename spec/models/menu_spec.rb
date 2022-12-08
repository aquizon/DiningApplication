require 'rails_helper'

RSpec.describe Menu, type: :model do
  before (:each) do 
    @chicken = MenuItem.create(name: "Chicken Alfredo", description: "Fettucine pasta in a creamy sauce with grilled chicken", meal_of_day: "Lunch", ingredients: "Chicken, Alfredo Sauce, Fettucine Pasta", calories: 400, allergens: "Dairy, Gluten", diet: "")
    @pancakes = MenuItem.create(name: "GF Pancakes", description: "Gluten free pancakes with butter and maple syrup", meal_of_day: "Breakfast", ingredients: "Rice Flour, Buttermilk, Oil, Maple Syrup, Butter", calories: 450, allergens: "Dairy", diet: "Vegetarian")
    @steak = MenuItem.create(name: "Steak", description: "Grilled Wagyu steak", meal_of_day: "Dinner", ingredients: "Wagyu Beef, Salt, Black Pepper", calories: 350, allergens: "", diet: "")
    @vegs = MenuItem.create(name: "Vegetable Stir Fry", description: "Assorted vegetebles fried with rice", meal_of_day: "Dinner", ingredients: "Carrots, Peas, Cabbage, Zucchini, Garlic, Onions, Rice", calories: 300, allergens: "Soy", diet: "Vegetarian, Vegan")
  end 

  context "sort_menu_by" do
    it "should correctly sort the menu by meal" do 
      expect(MenuItem.sort_items_by("meal_of_day", [])).to eq([@pancakes, @steak, @vegs, @chicken])
      expect(Menu.sort_menu_by("Breakfast", [])).to eq([@pancakes])
      expect(Menu.sort_menu_by("Fake Input", [])).to eq([])
    end 

    it "should correctly filter dietary restrictions" do 
      expect(Menu.sort_menu_by("meal_of_day", ["dairy"])).to eq([@steak, @vegs])
      expect(Menu.sort_menu_by("meal_of_day", ["dairy", "soy"])).to eq([@steak])
    end

    it "should correctly filter diets" do 
      expect(Menu.sort_menu_by("meal_of_day", ["vegan"])).to eq([@vegs])
      expect(Menu.sort_menu_by("meal_of_day", ["vegetarian"])).to eq([@pancakes, @vegs])
    end

    it "should correctly filter on multiple elements" do 
      expect(Menu.sort_menu_by("Dinner", ["soy"])).to eq([@steak])
      expect(Menu.sort_menu_by("Lunch", ["dairy"])).to eq([])
      expect(Menu.sort_menu_by("meal_of_day", ["dairy", "vegan"])).to eq([@vegs])
    end

  end

end
