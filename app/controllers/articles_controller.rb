class ArticlesController < ApplicationController
  def create
    @topic = Topic.find(params[:topic_id])
    @article = @topic.articles.build(params[:article])

    if @article.save
      redirect_to @topic, flash: { success: "投稿しました" }
    else
      @topic = Topic.find(params[:topic_id])
      render "topics/show"
    end
  end
end
