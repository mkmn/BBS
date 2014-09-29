class TopicsController < ApplicationController
  def index
    @topics = Topic.order("updated_at DESC").page(params[:page])
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
      redirect_to :topics, flash: { success: "新規スレッドを作成しました" }
    else
      render "new"
    end
  end
end
