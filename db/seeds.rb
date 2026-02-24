puts "🧹 Cleaning database..."
Atendance.destroy_all
Event.destroy_all
User.destroy_all

puts "👤 Creating users..."

admin = User.create!(
  email: "admin@yopmail.com",
  encrypted_password: "password",
  first_name: "Alice",
  last_name: "Admin",
  description: "Je crée des événements cools"
)

participant = User.create!(
  email: "participant@yopmail.com",
  encrypted_password: "password",
  first_name: "Bob",
  last_name: "Participant",
  description: "J'adore les events"
)

puts "🎉 Creating event..."

event = Event.create!(
  start_date: Time.now + 2.days,
  duration: 60,
  title: "Soirée Ruby",
  description: "Une super soirée pour parler de Ruby on Rails et boire des verres ensemble.",
  price: 10,
  location: "Paris",
  user: admin
)

puts "✉️ Creating attendance (this should send an email)..."

Atendance.create!(
  user: participant,
  event: event,
  stripe_customer_id: "cus_test_123456"
)

puts "✅ Seed finished!"