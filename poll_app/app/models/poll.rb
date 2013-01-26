class Poll < ActiveRecord::Base
  attr_accessible :user_id, :question

  belongs_to :user
  has_many :allowed_responses
  has_many :responses, :through => :allowed_responses

  

  def submitter
    self.user_id
  end





  # def self.add(url_id, tag_word)
  #   tag_words = ["news", "sports", "catz", "palo alto", "ruby", "slacklining"]
  #   t = Tag.new
  #   t.url_id = url_id
  #   t.tag_word = tag_word if tag_words.include?(tag_word)
  #   t.save!
  # end
end