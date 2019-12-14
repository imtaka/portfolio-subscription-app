class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  def index
    @posts = Post.all
  end

  def show
    @comment = @post.comments.build
    @comments = @post.comments
    @like = Like.new
  end

  def new
    @post = Post.new
  end

  def edit
  end

  def create
    unless current_user
      flash[:alert] = "Please sign in or sign up first"
      redirect_to new_user_session_path
    else
    @post = Post.new(post_params)
    @post.user = current_user
      if @post.save
        redirect_to @post, notice: 'Post was successfully created.'
      else
        render :new
      end
  end
end

  def update
    if @post.update(post_params)
      redirect_to @post, notice: 'Post was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @post.destroy
      redirect_to posts_url, notice: 'Post was successfully destroyed.'
  end

  private
    def set_post
      @post = Post.find(params[:id])
    end

    def post_params
      params.require(:post).permit(:subscription_name, :description, :monthly_price, :trial_term, :url, :post_image)
    end
end
