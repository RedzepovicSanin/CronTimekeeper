# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.destroy_all
Admin.create!(
  first_name: 'Admin',
  last_name: 'Adminko',
  email: 'admin@admin.com',
  password: 'admin123'
)
Admin.create!(
  first_name: 'Lav',
  last_name: 'Laver',
  email: 'lav@lav.com',
  password: 'lav123'
)
Employee.create!(
  first_name: 'Emp',
  last_name: 'Empko',
  email: 'emp@emp.com',
  password: 'emp123'
)
Employee.create!(
  first_name: 'Das',
  last_name: 'Dasko',
  email: 'das@das.com',
  password: 'das123'
)
