class MailsController < ApplicationController

	 # def index
	 # 	@users = Mail.all
	 # 	json_response(@users)
		#  end

def create 
		byebug
@mail = Mailing.create!(mail_params)
json_response(@mail, :created)
byebug
mailing_system = MailingSystem.new(mail_params)
mail_params = mailing_system.send

		# @mail = Mail.create(mail_params)
		# # @mail.token_refreshed = mailing_system.token_refreshed
		# json_response(@mail, :created)
	end

	# def show
	#     json_response(@user)
	#  end

	# def update
	#     @user.update(user_params)
	#     head :no_content
	# end


	# def destroy
	#     @user.destroy
	#     head :no_content
	# end
	
	private
		def mail_params
			params.permit(:email,:refresh_token,:oauth_token,:to,:body,:oauth_expires_at,:subject,:name,:uid)
		end

		# def set_user
		# 	@user = User.find(params[:id])
		# end
end
