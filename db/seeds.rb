1.times do 
  u = User.create(
    first_name: 'test',
    last_name: 'test',
    email: 'test@test.com',
    password: 'password'
  )
5.times do
  b = Board.create(
    name: Faker::Name.first_name,
    user_id: u.id
  )
  5.times do
    l = b.lists.create(
      name: Faker::Name.first_name,
      board_id: b.id
    )
    5.times do
     t = l.tasks.create(
        name: Faker::Name.first_name,
        done: Faker::Boolean.boolean(0.8),
        list_id: l.id
    )
     end
   end
  end
end

puts "10 customers created"