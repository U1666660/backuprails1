class Admin::CommentsController < Admin::ApplicationController
  def index
    if params[:search].present?
      @comments = Comment.matching_fullname_or_message(params[:search]).paginate(:page => params[:page], :per_page => 10)
    else
    @comments = Comment.where(status: to_bool(params[:status])).all.order(id: :desc).paginate(:page => params[:page], :per_page => 10)
  end
end

  def update
    @comment = Comment.find(params[:id])
    if @comment.update(status: params[:status])
      redirect_to :back, notice: 'Successfully updated comment'
    else
      redirect_to :back, notice: 'There was a problem updating comment'
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy

    redirect_to :back, notice: 'Successfully deleted comment'

  end
end
