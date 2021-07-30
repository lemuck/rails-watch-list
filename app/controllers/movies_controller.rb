class MoviesController < ApplicationController
  def new
    @movie = Movie.new
  end

  def create
    @list = movie.list
    @movie = Movie.new(movie_params)
    @movie.save
    redirect_to list_path(@list)
  end

  def index
    @movies = Movie.all
  end

  def show
    @movie = Movie.find(params[:id])
  end

  private

  def movie_params
    params.require(:movie).permit(:title)
  end
end
