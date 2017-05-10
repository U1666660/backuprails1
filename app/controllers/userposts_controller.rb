class UserpostsController < ApplicationController

def new
  @userpost = Userpost.new

end


  def create
    @userpost = Userpost.new(userpost_params)

     @userpost.save
      redirect_to :back, notice: 'Post was successfully created'
    #else
    #  flash[:alert] = 'There was a problem creatinng post'
    #  render :new

  end


  def userpost_params
     params.require(:userpost).permit(:id, :title, :content, :publish)
   end


end
