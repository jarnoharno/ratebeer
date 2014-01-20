class Beer < ActiveRecord::Base
  belongs_to :brewery
  has_many :ratings, :dependent => :destroy

  def average_rating
    if ratings.empty?
      nil
    else
      ratings.reduce(0) { |sum, r| sum + r.score } / ratings.count.to_f
    end
  end

  def to_s
    name + ' (' + brewery.name + ')'
  end
end
