class Poll < ActiveRecord::Base
  attr_accessible :user_id, :question

  belongs_to :user
  has_many :allowed_responses
  has_many :responses, :through => :allowed_responses

  validates :question, :user_id, :presence => true

  def results

    Poll.includes(:)

    self.allowed_responses.each do |ar|
      answers = ar.responses
      puts "Answer qty: #{answers.length} #{ar.allowed_response}"
    end
  end


  # def submitter
  #   self.user_id
  # end

end