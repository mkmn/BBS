class TopicsController < ApplicationController
  def index
    @topics = Topic.order("updated_at DESC")
  end

  def show
    @topic = Topic.find(params[:id])
    @article = Article.new
  end

  def new
    @topic = Topic.new
    @topic.articles.build
  end

  def create
    @topic = Topic.new(params[:topic])

    if @topic.save
      redirect_to :topics, notice: "新規スレッドを作成しました"
    else
      render "new"
    end
  end
end
