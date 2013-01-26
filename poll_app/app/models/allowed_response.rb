class AllowedResponse < ActiveRecord::Base
  attr_accessible :poll_id, :allowed_response

  belongs_to :poll
  has_many :responses





end