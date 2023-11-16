# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
require 'open-uri'
puts 'destroy in progress'
Article.destroy_all
puts 'Destroy done'

puts 'create articles'
file = URI.open('https://images.unsplash.com/photo-1682685797406-97f364419b4a?q=80&w=3540&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDF8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D')
article = Article.new(title: 'Super article', body: 'Wow comment faire pour déployer mon application')
article.pictures.attach(io: file, filename: 'test', content_type: 'jpg')
article.save!
puts 'done'