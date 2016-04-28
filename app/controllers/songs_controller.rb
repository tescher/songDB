class SongsController < ApplicationController
  def index
  end

  def import
    count = Song.import(params[:file])
    redirect_to_root root_url, notice: "#{count} songs imported!"
  end
end
