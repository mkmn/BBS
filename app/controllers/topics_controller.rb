class TopicsController < ApplicationController
  def index
    @topics = Topic.order("updated_at DESC")
  end

  def show
  end

  def new
  end

  def create
  end
end
