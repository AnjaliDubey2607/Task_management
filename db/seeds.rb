# frozen_string_literal: true

# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end


user = User.create(email: 'user123@email.com', password: '123456')
user2 = User.create(email: "user456@email.com", password: '123456')


task = Task.create(title: "test task", description: "test description", user_id: user.id )
task2 = Task.create(title: "test task 2", description: "test description 2", user_id: user.id )
task3 = Task.create(title: "test task", description: "test description", user_id: user2.id )
task4 = Task.create(title: "test task 2", description: "test description 2", user_id: user2.id )