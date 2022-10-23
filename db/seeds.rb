# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
Menu.destroy_all

Menu.create!(name: "Chicken Alfredo", description: "Fettucine pasta in a creamy sauce with grilled chicken", meal_of_day: "Dinner", ingredients: "Chicken, Alfredo Sauce, Fettucine Pasta", calories: 400, allergens: "Dairy, Gluten", diet: "")
Menu.create!(name: "Pizza", description: "Plain cheese pizza", meal_of_day: "Lunch", ingredients: "Flour, Eggs, Oil, Mozzerella Cheese, Tomatoes", calories: 250, allergens: "Dairy, Gluten", diet: "Vegetarian")
Menu.create!(name: "PB&J Sandwich", description: "Peanut Butter and Jelly Sandwich", meal_of_day: "Lunch", ingredients: "Whole Wheat Bread, Peanut Butter, Grape Jelly", calories: 150, allergens: "Gluten, Peanuts", diet: "Vegetarian, Vegan")
Menu.create!(name: "Vegetable Stir Fry", description: "Assorted vegetebles fried with rice", meal_of_day: "Dinner", ingredients: "Carrots, Peas, Cabbage, Zucchini, Garlic, Onions, Rice", calories: 300, allergens: "Soy", diet: "Vegetarian, Vegan")
Menu.create!(name: "GF Pancakes", description: "Gluten free pancakes with butter and maple syrup", meal_of_day: "Breakfast", ingredients: "Rice Flour, Buttermilk, Oil, Maple Syrup, Butter", calories: 450, allergens: "Dairy", diet: "Vegetarian")
Menu.create!(name: "Garlic Bread", description: "A side of garlic bread", meal_of_day: "Dinner", ingredients: "Bread, Butter, Garlic", calories: 75, allergens: "Dairy, Gluten", diet: "Vegetarian")
Menu.create!(name: "Yogurt", description: "Vanilla greek yogurt", meal_of_day: "Breakfast", ingredients: "Milk, Vanilla Extract", calories: 100, allergens: "Dairy", diet: "Vegatarian")
Menu.create!(name: "Steak", description: "Grilled Wagyu steak", meal_of_day: "Dinner", ingredients: "Wagyu Beef, Salt, Black Pepper", calories: 350, allergens: "", diet: "")