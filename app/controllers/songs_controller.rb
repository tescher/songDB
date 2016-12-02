class SongsController < ApplicationController
  def index
    if params[:request_format] == "xls"
      request.format = :xls
      @songs = Song.all.order('created_at ASC')
      # @songs = Song.all
    else
      @songs = Song.all.order('created_at DESC').take(10)
    end

    respond_to do |format|
      format.html {
        render :index
      }
      format.xls {
        response.headers['Content-Disposition'] = 'attachment; filename="songs.xls"'
        render "index.xls"
      }
    end

  end

  def import
    Song.delete_all
    count = Song.import(params[:file])
    redirect_to root_url, notice: "#{count} songs imported!"
  end

  def add_labels
    count, bad_count = Song.add_labels(params[:file])
    redirect_to root_url, notice: "#{count} songs updated, #{bad_count} errors, check console for details!"
  end
end
