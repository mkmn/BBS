topics = Topic.all

topics.each do |topic|
  10.times do |x|
    Article.create(
      poster: "テスト投稿者#{x}",
      body: "本文が入ります\n" * (x+1),
      topic: topic
    )
  end
end
