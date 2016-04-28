class CreateSongs < ActiveRecord::Migration
  def change
    create_table :songs do |t|
      t.string :artist
      t.string :artist_last_name
      t.string :album
      t.string :category
      t.string :year
      t.string :intro
      t.string :cue_in_time
      t.string :segue_time
      t.string :bpm
      t.string :volume
      t.string :path
      t.string :mixer_memory
      t.string :file_id
      t.string :pitch
      t.string :play_count
      t.string :last_played
      t.string :hot_key
      t.string :fade_override
      t.string :notes
      t.string :vocalist
      t.string :ending_type
      t.string :restrict_play_enabled
      t.string :start_date
      t.string :stop_date
      t.string :related_artist
      t.string :composer
      t.string :lyricist
      t.string :publisher
      t.string :record_id
      t.string :highest_chart
      t.string :popularity
      t.string :energy_mood
      t.string :unique_id
      t.string :color
      t.string :color_on
      t.string :ss
      t.string :ssrow

      t.timestamps null: false
    end
  end
end
