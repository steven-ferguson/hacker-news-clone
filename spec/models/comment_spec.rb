require 'spec_helper'

describe Comment do
  it { should validate_presence_of :content }
  it { should belong_to :commentable }
  it { should have_many :comments }
end