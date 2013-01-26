class AllowedResponse < ActiveRecord::Base
  attr_accessible :poll_id, :allowed_response

  belongs_to :poll
  has_many :responses

  validates :allowed_response, :poll_id, :presence => true





end