# frozen_string_literal: true

# User.destroy_all

# User.create!([{
#                name: Faker::Name.unique.name,
#                email: Faker::Internet.email,
#                type: 'Developer',
#                password: '12345678',
#                password_confirmation: '12345678'
#              },
#               {
#                 name: Faker::Name.unique.name,
#                 email: Faker::Internet.email,
#                 type: 'Manager',
#                 password: '12345678',
#                 password_confirmation: '12345678'
#               },
#               {
#                 name: Faker::Name.unique.name,
#                 email: Faker::Internet.email,
#                 type: 'QA',
#                 password: '12345678',
#                 password_confirmation: '12345678'
#               }])

# Project.destroy_all

# 3.times do |index|
#   Manager.first.projects.create!(title: "Title #{index}", description: "Description #{index}")
# end

Ticket.destroy_all

3.times do |index|
  User.last.tickets.create!(title: "Ticket Title #{index}",
                            type: 'Bug',
                            status: 'New',
                            project_id: 2,
                            assigned_to_id: 1,
                            description: "Ticket Description #{index}")
end
