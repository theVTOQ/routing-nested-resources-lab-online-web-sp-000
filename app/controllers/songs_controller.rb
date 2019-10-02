class SongsController < ApplicationController
  def index
    if params[:author_id]
      @songs = Author.find(params[:author_id]).posts
    else
      @songs = Song.all
      redirect_to artists_path, flash: {alert: "Artist not found"}
    end
  end

  def show
    @song = Song.find_by(id: params[:id])

    if params[:author_id]
      author = Author.find_by(id: params[:author_id])
      if author == nil || !@song.author = author
        redirect_to artists_path, flash: {alert: "Song not found"}
      end
    end
  end

  def new
    @song = Song.new
  end

  def create
    @song = Song.new(song_params)

    if @song.save
      redirect_to @song
    else
      render :new
    end
  end

  def edit
    @song = Song.find(params[:id])
  end

  def update
    @song = Song.find(params[:id])

    @song.update(song_params)

    if @song.save
      redirect_to @song
    else
      render :edit
    end
  end

  def destroy
    @song = Song.find(params[:id])
    @song.destroy
    flash[:notice] = "Song deleted."
    redirect_to songs_path
  end

  private

  def song_params
    params.require(:song).permit(:title, :artist_name)
  end
end
