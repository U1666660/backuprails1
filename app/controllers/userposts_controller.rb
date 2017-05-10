class UserpostsController < ApplicationController

layout 'user'

def index
  if params[:search].present?
    @userposts = Userpost.matching_title_or_content(params[:search]).paginate(:page => params[:page], :per_page => 10)
  else
  @userposts = Userpost.all.order(id: :desc).paginate(:page => params[:page], :per_page => 10)
end
end


def new
  @userpost = Userpost.new

end


  def create
    @userpost = Userpost.new(userpost_params)

    if @userpost.save
      redirect_to userposts_url, notice: 'Post was successfully created'
    else
      flash[:alert] = 'There was a problem creatinng post'
      render :new
    end

end


  def edit
 @userpost = Userpost.find(params[:id])

  end

  def update
    @userpost = Userpost.find(params[:id])
    if @userpost.update(userpost_params)
      redirect_to userposts_url, notice: 'Post was successfully updated'
    elsif
      flash[:alert] = "There was a problem updating post"
      render :edit
    end
  end

  def show
    @userpost = Userpost.find(params[:id])

  end

  def destroy
    @userpost = Userpost.find(params[:id])
    @userpost.destroy

    redirect_to :back, notice: 'Post was successfully deleted'

  end


  def userpost_params
     params.require(:userpost).permit(:id, :title, :content, :publish)
   end


end
