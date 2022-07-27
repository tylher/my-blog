# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
first_user = User.create(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.',
                         posts_counter: 0)
second_user = User.create(name: 'Lilly', photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
                          bio: 'Teacher from Poland.', posts_counter: 0)
third_user = User.create(name: 'Test', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Doctor from Brazil',
                         posts_counter: 0)
fourth_user = User.create(name: 'Test2', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Doctor from Brazil',
                          posts_counter: 0)
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
