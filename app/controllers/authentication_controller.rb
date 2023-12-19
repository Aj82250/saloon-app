class AuthenticationController < ApplicationController
	skip_before_action :authenticate_request
	# POST /auth/login
	def login
		@account = Account.find_by_email(params[:email])
		if @account&.authenticate(params[:password])
			token = jwt_encode(account_id: @account.id)
			render json: { token: token }, status: :ok
		else
			render json: { error: 'unauthorized' }, status: :unauthorized
		end
	end
end