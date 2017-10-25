 require 'random_data'

 50.times do
   Post.create!(
     title:  RandomData.random_sentence,
     body:   RandomData.random_paragraph
   )
 end
 posts = Post.all
 
 100.times do
   Comment.create!(
     post: posts.sample,
     body: RandomData.random_paragraph
   )
 end

 50.times do
 	Question.create!(
 		title: RandomData.random_question,
 		body: RandomData.random_paragraph,
 		resolved: "0"
 	)
 end
 
 puts "Seed finished"
 puts "#{Post.count} posts created"
 puts "#{Question.count} questionss created"