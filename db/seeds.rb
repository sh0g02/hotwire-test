# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).

# Create sample users
users_data = [
  { name: "John Doe", email: "john@example.com" },
  { name: "Jane Smith", email: "jane@example.com" },
  { name: "Bob Johnson", email: "bob@example.com" },
  { name: "Alice Brown", email: "alice@example.com" },
  { name: "Charlie Davis", email: "charlie@example.com" }
]

users_data.each do |user_data|
  User.find_or_create_by!(email: user_data[:email]) do |user|
    user.name = user_data[:name]
  end
end

puts "#{User.count} users in the database"
