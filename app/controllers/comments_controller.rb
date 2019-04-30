class CommentsController < ApplicationController
  def index
    @comment_topics = current_user.comment_topics
  end

  def create
    comment = comment.new
    comment.user_id = current_user.id
    comment.topic_id = params[:topic_id]
    comment.comment = params[:comment]

    if comment.save
      redirect_to topics_path, success: 'コメントを登録しました'
    else
      redirect_to topics_path, danger: 'コメント登録に失敗しました'
    end
  end
end
