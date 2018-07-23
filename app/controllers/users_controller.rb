class UsersController < ApplicationController
  def new
    if params[:back]
       @user = User.new(user_params)
       @user.icon_image.retrieve_from_cache! params[:cache][:icon_image]
     else
       @user = User.new
     end
 end

 def confirm
    @user = User.new(user_params)
    render :new if @user.invalid?
  end


 def create
  @user = User.new(user_params)
  @user.icon_image.retrieve_from_cache! params[:cache][:icon_image]
  if @user.save
    redirect_to user_path(@user.id)
  else
    render 'new'
  end
end

 def show
  @user = User.find(params[:id])
  @favorite_blogs = @user.favorite_blogs
end



 private
 def user_params
   params.require(:user).permit(:name, :email, :password, :password_confirmation,:icon_image, :icon_image_cache)
 end
end
