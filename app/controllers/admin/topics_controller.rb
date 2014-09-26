class Admin::TopicsController < Admin::Base 
  def index
    @topics = Topic.order("updated_at DESC").page(params[:page])
  end

  def show
    @topic = Topic.find(params[:id])
  end

  def edit
    @topic = Topic.find(params[:id])
  end

  def update
    @topic = Topic.find(params[:id])
    @topic.assign_attributes(params[:topic])
    
    if @topic.save
      redirect_to [:admin, @topic], notice: "スレッドを更新しました"
    else
      render "edit"
    end
  end

  def destroy
    @topic = Topic.find(params[:id])
    @topic.destroy
    redirect_to [:admin, :topics], notice: "トピックを削除しました"
  end
end
