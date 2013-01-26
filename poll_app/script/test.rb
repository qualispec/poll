

def run

    current_user = get_user

  while true

    puts "What would you like to do?"
    puts "1. Generate a poll"
    puts "2. Take a poll"
    puts "3. Poll results"
    puts "4. See my responses to polls"
    print " > "

    request = gets.chomp.to_i

    case request
    when 1
      generate_poll(current_user)
    when 2
      take_poll(current_user)
    when 3
      poll_results
    when 4
#      user_responses(current_user)
    end

  end
end

def get_user

  puts "Enter User Name:"
  print " > "
  user_name = gets.chomp

  current_user = User.find_or_create_by_name(user_name)

end

def generate_poll(user)
  puts "Enter your question:"
  question = gets.chomp

  poll = Poll.create(
    :user_id => user.id,
    :question => question)

  while true
    puts "Enter your allowed responses (enter q when you're done):"
    allowed_response = gets.chomp

    case allowed_response
    when 'q'
      break
    else
      AllowedResponse.create(
        :poll_id => poll.id,
        :allowed_response => allowed_response)
    end
  end
  poll
end

  def print_polls
    Poll.all.each_with_index do |poll, i|
    puts "#{i + 1}. #{poll.question}"
    end
  end

  def take_poll(user)

    puts "Which poll would you like to take? Enter number:"
    print " > "
    print_polls

    choice = gets.chomp.to_i

    poll = Poll.find(choice)

    puts poll.question

    allowed_responses = AllowedResponse.where(:poll_id => choice)

    allowed_responses.each do |allowed_response|
      puts "#{allowed_response.id}. #{allowed_response.allowed_response}"
    end

    puts "What is your response?"

    response = gets.chomp.to_i

    r = Response.create(
      :user_id => user.id,
      :poll_id => poll.id,
      :allowed_response_id => response)

    p r.errors.full_messages

  end

def poll_results

  puts "Which poll would you like to see results for? Enter number:"
  print " > "
  print_polls

  choice = gets.chomp.to_i

  poll = Poll.find(choice)

  poll.results

end


run
