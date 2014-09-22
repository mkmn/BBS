class TopicsController < ApplicationController
  def index
    @topics = Topic.order("updated_at DESC")
  end

  def show
    @topic = Topic.find(params[:id])
  end

  def new
    @topic = Topic.new
    @topic.articles.build
  end

  def create
  end
end
