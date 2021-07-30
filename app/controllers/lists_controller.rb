class ListsController < ApplicationController
  def index
    @lists = List.all
  end

  def show
    @list = List.find(params[:id])
    # @bookmarks = Bookmark.where(list_id: @list)
    # @bookmarks = @list.bookmarks
    @bookmark = Bookmark.new
    # @movies = Movie.where(id: @bookmark.movie_id)
    # @movies = @list.movies
  end

  def new
    @list = List.new
  end

  def create
    @list = List.new(list_params)
    @list.save
    redirect_to lists_path
  end

  def edit
    @list = List.find(params[:id])
  end

  def update
    @list = List.find(params[:id])
    @movies = @list.movies
    @list.save
    redirect_to list_path(@list)
  end

  private

  def list_params
    params.require(:list).permit(:name)
  end
end
