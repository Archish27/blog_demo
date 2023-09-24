# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

User.create(email: "test@gmail.com", password: "password", password_confirmation: "password", name: "John Doe")
posts = []
comments = []
elapsed = Benchmark.measure do
    1000.times do |x|
        puts "Post #{x}"
        post = Post.new(title: "Title #{x}", body: "Some Body#{x}", user_id: User.find_by(email: "test@gmail.com").id)
        posts.push(post)
        5.times do |y|
            puts "Comment #{y}"
            comment = post.comments.new(body: "Comment #{y}", user_id: User.first.id)
            comments.push(comment)
        end
    end
end
Post.import(posts)
Comment.import(comments,recursive: true)
puts "Elapsed time #{elapsed.real} seconds" 