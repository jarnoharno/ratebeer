class Brewery < ActiveRecord::Base
  has_many :beers, :dependent => :destroy
  has_many :ratings, :through => :beers

  def average_rating
    if ratings.empty?
      nil
    else
      ratings.reduce(0) { |sum, r| sum + r.score } / ratings.count.to_f
    end
  end
end
