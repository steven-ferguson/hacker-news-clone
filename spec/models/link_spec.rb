require 'spec_helper'

describe Link do 
  it { should validate_presence_of :url }
  it { should have_many :votes }
  it { should have_many :comments }

  it "should have a score based on its number of upvotes" do
    Timecop.freeze(Time.now)
    link = Link.create(:url => 'http://www.google.com')
    2.times { link.votes.create }
    link.score.should eq 2
  end

  it "should sort link based on their number of upvotes" do
    link = Link.create(:url => 'http://www.google.com')
    link.votes.create 
    link2 = Link.create(:url => 'http://www.yahoo.com')
    2.times { link2.votes.create }
    link3 = Link.create(:url => 'http://www.bing.com')
    Link.sort_by_score.should eq [link2, link, link3]
  end

  it "should sort link based on their number of upvotes and the time since their posting" do
    link = Link.create(:url => 'http://www.google.com')
    Timecop.freeze(Time.now + 3.hour) 
    link2 = Link.create(:url => 'http://www.yahoo.com')
    Link.sort_by_score.should eq [link2, link]
  end
end