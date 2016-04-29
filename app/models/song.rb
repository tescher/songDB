class Song < ActiveRecord::Base
  require 'csv'


  def self.import(file)
    count = 0
    CSV.foreach(file.path, headers:true, :row_sep => :auto, col_sep: "\t", encoding: 'utf-8') do |row|
      puts row.to_hash
      Song.create! row.to_hash.transform_keys{ |k| ColumnTransform.find_by_external(k).internal.to_sym }
      count += 1
    end
    count
  end

  def self.add_labels(file)
    count = 0
    bad_count = 0
    CSV.foreach(file.path, headers:true, :row_sep => :auto, col_sep: "\t", encoding: 'utf-8') do |input_row|
      row = input_row.to_hash.transform_keys{ |k| ColumnTransform.find_by_external(k).internal.to_sym }
      puts row
      song = Song.find_by_ss_and_ssrow(row[:ss], row[:ssrow])
      if (song.title != row[:title])
        MyLog.info("Title doesn't match for song #{song.id}, '#{row[:title]}' <> '#{song.title}'")
        bad_count += 1
      else if (song.album != row[:album])
             MyLog.info("Album doesn't match for song #{song.id}, '#{row[:album]}' <> '#{song.album}'")
             bad_count += 1
           else if (song.artist != row[:artist])
                  MyLog.info("Artist doesn't match for song #{song.id}, '#{row[:artist]}' <> '#{song.artist}'")
                  bad_count += 1
                else
                  Song.update( song.id, publisher: row[:publisher] )
                  count += 1
                end
           end
      end
    end
    return count, bad_count
  end


end
