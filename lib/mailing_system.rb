require 'net/smtp'
class MailingSystem
	
	def initialize(mail_params)
		byebug
		@mail_params = mail_params
		# gem hashie
		# @mail_params = Hashie::Mash.new(mail_params)
		#@token_refreshed = false
	end

	def send
		
		t = @mail_params["oauth_token"]
		byebug
		# @mail_params.refresh! if ((@mail_params["oauth_expires_at"]) < Time.now)
 		smmtp = Net::SMTP.new('smtp.gmail.com', 587)
 		byebug
	   smmtp.enable_starttls_auto
	   smmtp.start('gmail.com' ,@mail_params["email"], @mail_params["oauth_token"], :xoauth2)
	   
	   message = ''
	   message = %W(
		# 						From: #{@mail_params["name"]} <#{@mail_params["email"]}>
		# 						To: #{@mail_params["to"]}
		# 						MIME-Version: 1.0
		# 						Content-type: text/html
		# 						Subject: #{@mail_params["subject"]}
		# 						#{@mail_params["body"]}
		# 					)
	   smmtp.send_message message,@mail_params["email"],@mail_params["to"]
	   byebug
	   @mail_params
	end

	def to_params
    { 
    	'refresh_token' => @mail_params["refresh_token"],
      'client_id'     => '1058339180581-et1k3u81ll6ji8q27bs3q777u1do8tdc.apps.googleusercontent.com',
      'client_secret' => 'vn-Aa97wDFInTxxz7cAgl6RD',
      'grant_type'    => 'refresh_token'
   	}
	end

  def refresh!
  	byebug
  #	@token_refreshed = true
    data = JSON.parse(request_token_from_google.body)
    @mail_params["oauth_token"] = data['access_token'],
    @mail_params["oauth_expires_at"] = Time.now + data['expires_in'].to_i.seconds
	end

	def request_token_from_google
    url = URI("https://accounts.google.com/o/oauth2/token")
    Net::HTTP.post_form(url, self.to_params)
	end
end
