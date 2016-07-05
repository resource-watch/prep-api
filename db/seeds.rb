# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
AdminUser.find_by_email("admin@example.com" ) || AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password')

DatasetType.find_by_name("Chart") || DatasetType.create!(name: 'Chart')
DatasetType.find_by_name("Layer") || DatasetType.create!(name: 'Layer')

Partner.find_by_name("Vizzuality") || Partner.create!(
  name: 'Vizzuality',
  url: 'http://vizzuality.com',
  contact_name: 'Vizzuality',
  contact_email: 'contact@vizzuality.com',
  logo: File.new("db/partner-images-seed/vizzuality@2x.png"),
  published: true)
Partner.find_by_name("WRI") || Partner.create!(
  name: 'WRI',
  url: 'http://www.wri.org/',
  contact_name: 'WRI',
  contact_email: 'contact@wri.com',
  logo: File.new("db/partner-images-seed/wri@2x.png"),
  published: true)
Partner.find_by_name("Nasa") || Partner.create!(
  name: 'Nasa',
  url: 'https://www.nasa.gov/',
  contact_name: 'Nasa',
  contact_email: 'contact@nasa.gov',
  logo: File.new("db/partner-images-seed/nasa@2x.png"),
  published: true)
Partner.find_by_name("Washington University") || Partner.create!(
  name: 'Washington University',
  url: 'http://www.washington.edu/',
  contact_name: 'UW',
  contact_email: 'contact@uw.edu',
  logo: File.new("db/partner-images-seed/university-washington@2x.png"),
  published: true)
