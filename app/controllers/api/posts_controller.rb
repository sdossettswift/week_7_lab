class Api::PostsController < ApplicationController
  protect_from_forgery with: :null_session
  before_action :doorkeeper_authorize!
def index
  @posts = Post.all
end

def show
  @post =Post.find_by id: params[:id]
end

def create
  @post = Post.new params.require(:title)
  if @post.save
    render :show
  else
    render json: @post.errors, status: 422
  end
end

def update
  @post = Post.find_by id: params[:id]
  if @post.update params.require(:title)
    render :show
  else
    render json: @post.errors, status 422
  end
end

def delete
  @post =Post.find_by id: params[:id]
  @post.destory
  head :ok
end
end
