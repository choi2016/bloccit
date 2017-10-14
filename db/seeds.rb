 require 'random_data'

 50.times do
   Post.create!(
     title:  RandomData.random_sentence,
     body:   RandomData.random_paragraph
   )
 end

 Post.find_or_create_by(title: 'CP16 assignment title', body: 'CP16 assignment body')
 posts = Post.all
 post1 = Post.last
 
 Comment.create!(
 	post: post1,
 	body: 'Unique body'
 )

 100.times do
   Comment.create!(
     post: posts.sample,
     body: RandomData.random_paragraph
   )
 end
 
 puts "Seed finished"
 puts "#{Post.count} posts created"
 puts "#{Comment.count} comments created"