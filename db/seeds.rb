# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all
Place.destroy_all
List.destroy_all
UserList.destroy_all
ListPlace.destroy_all

# :name,
# :email,
# :password,
# :password_confirmation
user = User.create([
                     {name: "Chris", email: "chimpBanana@dm.com", password: "1234", password_confirmation: "1234"}
                   ])


# :name,
# :description,
# :rating,
# :created_by
places = Place.create([
                         {name: "LES", description: "a skatepark", rating: 5, created_by: User.first.id},
                         {name: "Blue park", description: "a chiller skatepark", rating: 5, created_by: User.first.id},
                         {name: "Borough Hall", description: "a street spot", rating: 4, created_by: User.first.id},
                         {name: "Brooklyn Banks", description: "a street spot", rating: 3, created_by: User.first.id}
                       ])

# :title
# :created_by
lists = List.create([
                      {title: "Skate spots", created_by: User.first.id},
                      {title: "Skateparks", created_by: User.first.id}
                    ])

user_lists = UserList.create([{user_id: User.first.id, list_id: lists[0].id}, {user_id: User.first.id, list_id: lists[1].id}])
list_places = ListPlace.create([{list_id: lists[0].id, place_id: places[2].id}, {list_id: lists[0].id, place_id: places[3].id}, {list_id: lists[1].id, place_id: places[0].id}, {list_id: lists[1].id, place_id: places[1].id}])
