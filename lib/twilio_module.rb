module Twilio

  require 'twilio-ruby' 

  def send_text
    account_sid = 'AC8fd356d09cec0d4617c7a7ca18db4ddc' 
    auth_token = ENV['TWILIO_KEY'] # insert twilio key here

    @client = Twilio::REST::Client.new account_sid, auth_token 

    @client.account.messages.create({
      :to => '+447838520310',
      :from => '+14842342425',   
      :body => "Thanks for ordering with Jake's pizza! Your food is on it's way!" 
    }) 
    return true
  end

end