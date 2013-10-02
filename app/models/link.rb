class Link < ActiveRecord::Base
  has_many :votes
  has_many :comments, as: :commentable
  validates :url, :presence => true, :url => true

  def score 
    self.votes.count - (Time.now - self.created_at)/ 3600
  end

  def self.sort_by_score 
    self.all.sort_by {|link| link.score }.reverse
  end
end