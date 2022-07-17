class PostsController < ApplicationController
  def index
    @month = params[:month] ? Date.parse(params[:month]) : Time.current
    @posts = Post.where(user_id: current_user.id, spend_date: @month.all_month).order(:spend_date)
    @total = 0
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if @post.save
      redirect_to posts_path
    else
      render :new
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    @post.user_id = current_user.id
    if @post.update(post_params)
      redirect_to posts_path
    else
      render :edit
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_path
  end

  private
  def post_params
    params.require(:post).permit(:user_id, :title, :spend_date, :money)
  end
end
