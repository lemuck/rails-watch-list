class BookmarksController < ApplicationController
  def index
    @bookmarks = Bookmark.all
  end

  def show
    @bookmark = Bookmark.find(params[:id])
    @movie = Movie.where(id: movie_id)
  end

  def new
    @list = List.find(params[:list_id])
    @bookmark = Bookmark.new
  end

  def create
    @bookmark = Bookmark.new(bookmark_params)
    #@list = List.find(params[:list_id])
    @bookmark.list_id = params[:list_id]
    #@bookmark.list = @list

    @bookmark.save
    redirect_to list_path(params[:list_id])
  end

  def bookmark_params
    params.require(:bookmark).permit(:comment)
  end
end
