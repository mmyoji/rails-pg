# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

[
  { username: "test1", email: "test1@example.com" },
  { username: "test2", email: "test2@example.com" },
  { username: "test3", email: "test3@example.com" },
].each do |attrs|
  User.find_or_create_by(username: attrs.fetch(:username)) do |u|
    u.email              = attrs.fetch(:email)
    u.password_digest    = BCrypt::Password.create("password")
    u.confirmation_token = SecureRandom.urlsafe_base64
  end
end
