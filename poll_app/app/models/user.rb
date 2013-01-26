class User < ActiveRecord::Base
  attr_accessible :name

  has_many :polls
  has_many :responses

  validates :name, :presence => true



  def my_polls
    self.polls
  end

  def my_responses
    self.responses
  end



end