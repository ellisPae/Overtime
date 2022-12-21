class PostsController < ApplicationController
  before_action :set_post, only: [:show]

  def index
    @posts = Post.all
    render :index
  end

  def new
    @post = Post.new
  end
  # just renders the new form

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    # devise provides current_user

    if @post.save
      redirect_to @post, notice: "Your post was successfully created"
    else
      render :new
    end
  end

  def show
  end

  private

  def post_params
    params.require(:post).permit(:date, :rationale)
  end

  def set_post
    @post = Post.find(params[:id])
  end
end
