class MoviesController < ApplicationController
  before_action :move_to_index, except: :index

  def index
    @movies = Movie.all
  end

  def show
    @movies = Movie.all
  end

  def move_to_index
    redirect_to action: :index, flash: {error: "ログインしてください"} unless user_signed_in?
  end

end