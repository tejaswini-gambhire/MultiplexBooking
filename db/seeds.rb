# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Role::TYPES.each do |key, value|
  Role.find_or_create_by(name: value)
end

p "======= Created Roles ==========="

screens = [
  {name: 'Screen 1', seat_distribution: {lower: {count: 30, additional_cost: 0},
   upper: {count: 20, additional_cost: 20}}},
  {name: 'Screen 2', seat_distribution: {lower: {count: 30, additional_cost: 20},
   upper: {count: 20, additional_cost: 40}}},
  {name: 'Screen 3', seat_distribution: {lower: {count: 30, additional_cost: 10},
   upper: {count: 20, additional_cost: 30}}}
]

screens.each do |screen_detail|
  screen = Screen.find_or_initialize_by(name: screen_detail[:name])
  screen.assign_attributes(
    seat_distribution: screen_detail[:seat_distribution],
    total_seats: screen_detail[:seat_distribution].map{|a, b| b[:count]}.sum
  )
  screen.save
end

p "=========== Created Screens ========="

movies = [
  {name: 'Star Wars', duration: 150},
  {name: 'Lord of The Rings', duration: 120},
  {name: 'The Avengers', duration: 150},
  {name: 'Iron Man', duration: 120}
]

movies.each do |movie_detail|
  Movie.find_or_create_by(
    name: movie_detail[:name],
    duration: movie_detail[:duration],
    is_active: true
  )
end

p "======== Created Movies =========="

[{movie: 'Star Wars', date: Date.tomorrow, start_time: '12pm',
  base_price: 200, screen: 'Screen 1'},
 {movie: 'Star Wars', date: Date.tomorrow, start_time: '9pm',
  base_price: 200, screen: 'Screen 1'},
 {movie: 'Star Wars', date: Date.tomorrow + 1.day, start_time: '6pm',
  base_price: 220, screen: 'Screen 1'},
 {movie: 'The Avengers', date: Date.tomorrow, start_time: '12pm',
  base_price: 180, screen: 'Screen 2'},
 {movie: 'The Avengers', date: Date.tomorrow, start_time: '9pm',
  base_price: 200, screen: 'Screen 3'},
 {movie: 'Lord of The Rings', date: Date.tomorrow, start_time: '3pm',
  base_price: 150, screen: 'Screen 1'},
 {movie: 'Lord of The Rings', date: Date.tomorrow + 1.day, start_time: '3pm',
  base_price: 150, screen: 'Screen 1'},
 {movie: 'Iron Man', date: Date.tomorrow, start_time: '3pm',
  base_price: 150, screen: 'Screen 2'},
 {movie: 'Iron Man', date: Date.tomorrow + 1.day, start_time: '12pm',
  base_price: 150, screen: 'Screen 1'},
].each do |show|
  movie = Movie.find_by(name: show[:movie])
  screen = Screen.find_by(name: show[:screen])
  start_time = DateTime.parse("#{show[:date]} #{show[:start_time]} IST")
  end_time = start_time + movie.duration.minutes

  movie_show =  Show.find_or_create_by(
                  movie_id: movie.id,
                  screen_id: screen.id,
                  date: show[:date],
                  start_time: start_time,
                  end_time: end_time
                )

  seats = []
  number = 0
  screen.seat_distribution.each do |type, data|
    data["count"].times do
      seats << {
        position: type,
        name: "#{number+=1}",
        show_id: movie_show.id,
        booking_id: nil,
        price: show[:base_price] + data["additional_cost"],
        created_at: DateTime.now,
        updated_at: DateTime.now
      }
    end
  end

  result = Seat.insert_all(seats)
  p result.inspect
  p "============ created show =========="
end

