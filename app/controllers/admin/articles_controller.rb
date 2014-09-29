class Admin::ArticlesController < Admin::Base
  def edit
    @topic = Topic.find(params[:topic_id])
    @article = Article.find(params[:id])
  end

  def update
    @topic = Topic.find(params[:topic_id])
    @article = Article.find(params[:id])
    @article.assign_attributes(params[:article])

    if @article.save
      redirect_to [:admin, @topic], flash: { success: "投稿を更新しました" }
    else
      render "edit"
    end
  end

  def destroy
    @topic = Topic.find(params[:topic_id])
    @article = Article.find(params[:id])
    @article.destroy
    redirect_to [:admin, @topic], flash: { success: "投稿を削除しました" }
  end
end
