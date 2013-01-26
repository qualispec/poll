class Poll < ActiveRecord::Base
  attr_accessible :user_id, :question

  belongs_to :user
  has_many :allowed_responses
  has_many :responses, :through => :allowed_responses

  validates :question, :user_id, :presence => true

  def results
    allowed_responses = AllowedResponse.where(:poll_id => self.id)

    allowed_responses.each do |ar|
      answers = Response.where(:allowed_response_id => ar.id)
      puts "Answer qty: #{answers.length} #{ar.allowed_response}"
    end
    #allowed_response_id
  end


  # def submitter
  #   self.user_id
  # end

end