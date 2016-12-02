module SongsHelper

  def update_song_labels(matches, publisher, how)
    matches.each do |song|
      if (song.publisher.blank?)
        Song.update(song.id, publisher: publisher, how: how)
        MyLog.info("Found song #{song.id}, Title = '#{song.title}', Album = '#{song.album}', Artist = '#{song.artist}' ")
        @count += 1
      else
        MyLog.info("Found song #{song.title}, but publisher exists #{song.publisher}")
      end
    end

  end

end
