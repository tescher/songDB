class Song < ActiveRecord::Base
  require 'csv'

  def self.import(file)
    count = 0;
    CSV.foreach(file.path, headers:true, col_sep: "\t") do |row|
      Song.create! row.to_hash
      count += 1
    end
    count
  end
end
