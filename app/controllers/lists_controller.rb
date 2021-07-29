class ListsController < ApplicationController
  def index
    @lists = List.all
  end

  def show
    @list = List.find(params[:id])
    # @bookmarks = Bookmark.where(list_id: @list)
    @bookmarks = @list.bookmarks
    # @movies = Movie.where(id: @bookmark.movie_id)
  end

  def new
    @list = List.new
  end

  def create
    @list = List.new(list_params)
    @list.save
    redirect_to lists_path
  end

  private

  def list_params
    params.require(:list).permit(:name)
  end
end
