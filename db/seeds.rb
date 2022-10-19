User.destroy_all

User.create!([{
  name: Faker::Name.unique.name,
  email: Faker::Internet.email,
  type: 'Developer',
  password: '12345678',
  password_confirmation: '12345678'
},
{
  name: Faker::Name.unique.name,
  email: Faker::Internet.email,
  type: 'Manager',
  password: '12345678',
  password_confirmation: '12345678'
},
{
  name: Faker::Name.unique.name,
  email: Faker::Internet.email,
  type: 'QA',
  password: '12345678',
  password_confirmation: '12345678'
}])

p "Created #{User.count} users"

Project.destroy_all

3.times do |index|
  Manager.first.projects.create!(title: "Title #{index}", description: "Description #{index}")
end

p "Created #{Project.count} projects"

Ticket.destroy_all

3.times do |index|
  User.first.tickets.create!(title: "Ticket Title #{index}",
                             type: 'Bug',
                             status: 'New',
                             project_id: index + 1,
                             description: "Ticket Description #{index}")
end

p "Created #{Ticket.count} tickets"
