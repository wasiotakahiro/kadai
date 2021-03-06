class BlogsController < ApplicationController
  before_action :set_blog, only: [:show, :edit, :update, :destroy]
  before_action :require_sign_in!, only: [:new, :edit, :show]
 def index
    @blogs = Blog.all
 end

  def new
    if params[:back]
      @blog = Blog.new(blog_params)
      @blog.image.retrieve_from_cache!  params[:cache][:image]
    else
      @blog = Blog.new
    end
  end

 def create
    @blog = Blog.new(blog_params)
    @blog.user_id = current_user.id # login user がblog を投稿
    @blog.image.retrieve_from_cache!  params[:cache][:image]
    if @blog.save
      redirect_to blogs_path, notice: "ブログを作成しました！"
      @inform = current_user.email
      ContactMailer.send_mail(@inform).deliver
    else
      render 'new'
    end


 end

  def show
    @favorite = current_user.favorites.find_by(blog_id: @blog.id)
  end

  def edit
  end

  def update
    if @blog.update(blog_params)
      redirect_to blogs_path, notice: "ブログを編集しました！"
    else
      render 'edit'
    end
  end

  def destroy
    @blog.destroy
    redirect_to blogs_path, notice:"ブログを削除しました！"
  end

  def confirm
    @blog = Blog.new(blog_params)
    @blog.user_id=current_user.id
    render :new if @blog.invalid?
  end


  private
    def blog_params
      params.require(:blog).permit(:title, :content, :image, :image_cache)
    end

    def set_blog
      @blog = Blog.find(params[:id])
    end

    def set_user_infomation
      @user = User.find(params[:id])
    end

    def require_sign_in!
      unless logged_in?
        redirect_to sessions_new_path, noctice:"ログインしてください"
      end
    end
  end
