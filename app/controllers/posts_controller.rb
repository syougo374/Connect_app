class PostsController < ApplicationController
  before_action :set_blog, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only:[:new, :edit, :update, :destroy]
  def index
  end

  def create 
  end

  def _form
  end

  def edit
  end

  def show
  end

  def new
  end
end
