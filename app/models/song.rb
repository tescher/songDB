include SongsHelper

class Song < ActiveRecord::Base
  require 'csv'


  def self.import(file)
    count = 0
    CSV.foreach(file.path, headers:true, :row_sep => :auto, col_sep: "\t", encoding: 'utf-8', quote_char: "Ƃ") do |row|
      puts row.to_hash
      Song.create! row.to_hash.transform_keys{ |k| ColumnTransform.find_by_external(k).internal.to_sym }
      count += 1
    end
    count
  end

  def self.add_labels(file)
    @count = 0
    CSV.foreach(file.path, headers:true, :row_sep => :auto, col_sep: "\t", encoding: 'utf-8', quote_char: "Ƃ") do |input_row|
      row = input_row.to_hash.transform_keys{ |k| ColumnTransform.find_by_external(k).internal.to_sym }
      puts row
      if (!row[:publisher].blank?)
        # song = Song.find_by_ss_and_ssrow(row[:ss], row[:ssrow])
        # Try matching on title, album, and artist
        if (!row[:title].blank? && !row[:artist].blank? && !row[:album].blank?)
          MyLog.info("Checking title, album, and artist for #{row[:title]}/#{row[:album]}/#{row[:artist]}")
          matches = Song.where(title: row[:title], artist: row[:artist], album: row[:album]).all
          update_song_labels(matches, row[:publisher], "All three")
        end
        # Try matching on title & album
        if (!row[:title].blank? && !row[:album].blank?)
          MyLog.info("Checking title and album for #{row[:title]}/#{row[:album]}")
          matches = Song.where(title: row[:title], album: row[:album]).all
          update_song_labels(matches, row[:publisher], "Title and Album")
        end
        # Try matching on title & artist
        if (!row[:title].blank? && !row[:artist].blank?)
          MyLog.info("Checking title and artist for #{row[:title]}/#{row[:artist]}")
          matches = Song.where(title: row[:title], artist: row[:artist]).all
          update_song_labels(matches, row[:publisher], "Title and Artist")
        end
        # Try matching on title & album
        if (!row[:title].blank? && !row[:album].blank?)
          MyLog.info("Checking artist and album for #{row[:artist]}/#{row[:album]}")
          matches = Song.where(artist: row[:artist], album: row[:album]).all
          update_song_labels(matches, row[:publisher], "Artist and Album")
        end
      end
    end
    return count
  end


end
