
#THE ONLY DATA SEEDING IS THE BIRDS......
#USER AND BIRD OBJECTS DON'T SEEM TO BE SAVING TO THE DB

User.create(name: "Bobby Smith", age: 22, username: "Bobby123", email: "bobby123@gmail.com", location: "TX, USA")
User.create(name: "Jordan Mann", age: 29, username: "Jmann", email: "j.mann@gmail.com", location: "TX, USA")
User.create(name: "Sarah Stewart", age: 54, username: "MissBirdQueen", email: "SarahStewart@gmail.com", location: "TX, USA")
User.create(name: "Ted Logan", age: 43, username: "ThisIsTed", email: "t.logan@gmail.com", location: "TX, USA")
User.create(name: "Hayley Jamison", age: 35, username: "HayleyGirl1", email: "HayleyGirl1@gmail.com", location: "TX, USA")


Bird.create(species: "Mocking Bird", visual_description: "Smaller, lean bird. Mix of grey, white, and black feathers", call_description: "was mimicking a common spearrow at the time!", quantity: 1)
Bird.create(species: "Common Spearrow", visual_description: "Mixed brown, tan, black and white feathers. Very small bird.", call_description: "cheep! cheep!", quantity: 5)
Bird.create(species: "Turkey Vulture", visual_description: "Very massive, black vulture. Bald and somewhat grey head.", call_description: "Wasn't able to hear!", quantity: 2)
Bird.create(species: "Blue Jay", visual_description: "Mixed blue, white, and back feathers. Straight Beak.", call_description: "Sharp and loud", quantity: 1)
Bird.create(species: "Grackle", visual_description: "Males, all shiney black with hints of blues and purples in the reflected light. Vivid, yellow eyes.", call_description: "These two were facing off for a mate and were doing the classic Grackle mating call. It's sort of like a spit of sound that 'breaks' the air followed by repetitious whoops", quantity: 2)


Sighting.create(user_id: 1, bird_id: 6, location: "Central Texas, USA", date_spotted: "May 1 2010")
Sighting.create(user_id: 2, bird_id: 6, location: "Central Texas, USA", date_spotted: "September 16-18 2012")
Sighting.create(user_id: 3, bird_id: 2, location: "Central Texas, USA", date_spotted: "October 30 2015")
Sighting.create(user_id: 4, bird_id: 3, location: "Central Texas, USA", date_spotted: "March 4-8 2014")
Sighting.create(user_id: 5, bird_id: 6, location: "Central Texas, USA", date_spotted: "April 1-3 2020")
Sighting.create(user_id: 5, bird_id: 2, location: "Central Texas, USA", date_spotted: "April 1-3 2020")
Sighting.create(user_id: 5, bird_id: 4, location: "Central Texas, USA", date_spotted: "April 1-3 2020")
Sighting.create(user_id: 3, bird_id: 5, location: "Central Texas, USA", date_spotted: "October 30 2015")
Sighting.create(user_id: 1, bird_id: 3, location: "Central Texas, USA", date_spotted: "May 2 2010")
Sighting.create(user_id: 1, bird_id: 4, location: "Central Texas, USA", date_spotted: "June 5 2010")
Sighting.create(user_id: 2, bird_id: 5, location: "Central Texas, USA", date_spotted: "September 16-18 2012")
Sighting.create(user_id: 4, bird_id: 4, location: "Central Texas, USA", date_spotted: "March 4-8 2014")
Sighting.create(user_id: 4, bird_id: 2, location: "Central Texas, USA", date_spotted: "March 4-8 2014")
Sighting.create(user_id: 2, bird_id: 3, location: "Central Texas, USA", date_spotted: "September 16-18 2012")
Sighting.create(user_id: 5, bird_id: 6, location: "Central Texas, USA", date_spotted: "April 1-3 2020")
