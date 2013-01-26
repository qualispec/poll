class Response < ActiveRecord::Base
  attr_accessible :user_id, :poll_id, :allowed_response_id

  belongs_to :allowed_response
  has_one :poll, :through => :allowed_response

  validates :user_id, :poll_id, :allowed_response_id, :presence => true
  validates :poll_id, :uniqueness => { :scope => :user_id, :message =>
    "Must not answer poll twice." }





end