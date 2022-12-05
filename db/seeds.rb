user = User.create(email: "isaac@test.com", password: "123123", name: "Isaac", surname: "Tavares Caldas Gonçalves", nickname: "isaac_test")

themes = [
  {name: "Abstract"},
  {name: "Animal"},
  {name: "Anime"},
  {name: "Caricature"},
  {name: "Cartoon"},
  {name: "Child"},
  {name: "Design"},
  {name: "Food"},
  {name: "Marketing"},
  {name: "Nature"},
  {name: "Painting"},
  {name: "Photography"},
  {name: "Sculpture"},
  {name: "Urban"},
  {name: "UX & UI"},
]

Theme.create(themes)

Theme.all.each do |theme|
  rand(1..5).times.each do |i|
    Post.create(
      title: "Post ##{i}", 
      description: "Lorem ipsum sit amet of post ##{i}",
      theme_id: theme.id,
      user_id: user.id
    )
  end
end

posts = Post.all
posts.each do |post|
  comments = []
  rand(1..7).times.each do |i|
    rand_bool = false
    rand_bool = [true, false].sample unless comments.empty?
    main_comment = comments.sample.id if rand_bool 

    comment = Comment.create(
      description: "Lorem ipsum sit amet, comment ##{i + 1}",
      user_id: User.first.id,
      post_id: post.id,
      main_comment_id: main_comment
    )

    comments << comment
  end
end
