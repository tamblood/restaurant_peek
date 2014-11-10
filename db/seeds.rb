user1 = User.new(name: "Tam Blood", username: "tam", password: "nolikebikes", phone: "415-595-0175")
restaurant1 = Restaurant.new(name: "Plow", special: "smoked trout salad")
restaurant2 = Restaurant.new(name: "Kabuto", special: "toro tartare")
#restaurant3 = Restaurant.new(name: "Curry Up Now", special: "deconstructed samosa")
user1.save
restaurant1.save
restaurant2.save
user1.restaurants << restaurant1
user1.restaurants << restaurant2
#user1.restaurants << restaurant3
user1.save
