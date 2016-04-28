class Song < ActiveRecord::Base
  require 'csv'

  def self.import(file)
    count = 0;
    CSV.foreach(file.path, headers:true, :row_sep => :auto, col_sep: "\t", encoding: 'windows-1251:utf-8') do |row|
      pp row
      Song.create! row.to_hash.map{ |k,v| {ColumnTransform.find_by_external(k).to_sym => v}}
      count += 1
    end
    count
  end
end
