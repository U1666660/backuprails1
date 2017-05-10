class PostsController < ApplicationController
 after_filter :clear_session, only: [:show]


  def index

      if params[:tag]
        @posts = Post.filter_by_tags(params[:tag]).paginate(:page => params[:page], :per_page => (Setting.post_per_page) )

    else
    @posts = Post.published.paginate(:page => params[:page], :per_page => (Setting.post_per_page) )
  end
  end

  def show
    @post = Post.find(params[:id])
    @visitor_comment = visitor_comment

  end

private

    def clear_session
        [:visitor_errors, :visitor_params].each { |k| session.delete(k) }

    end

    def visitor_comment
      if session[:visitor_errors]
        VisitorCommentService.new(session[:visitor_params]).visitor
      else
        Visitor.new(comments: [Comment.new])
      end
    end


end
