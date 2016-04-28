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
end
