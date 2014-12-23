module Twilio

  require 'twilio-ruby' 

  def send_text
    account_sid = 'AC8fd356d09cec0d4617c7a7ca18db4ddc' 
    auth_token = 'e86a2de62b7f7e5080bed5c8f39a977b' 

    @client = Twilio::REST::Client.new account_sid, auth_token 

    @client.account.messages.create({
      :to => '+447838520310',
      :from => '+14842342425',   
      :body => "Thanks for ordering with Jake's pizza! Your food is on it's way!" 
    }) 
  end

end