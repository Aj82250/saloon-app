class AuthenticationController < ApplicationController
	skip_before_action :authenticate_request
	# POST /auth/login
	def login
		@owner = Owner.find_by_email(params[:email])
		if @owner&.authenticate(params[:password])
			token = jwt_encode(owner_id: @owner.id)
			render json: { token: token }, status: :ok
		else
			render json: { error: 'unauthorized' }, status: :unauthorized
		end
	end
end