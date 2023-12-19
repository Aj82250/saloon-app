class ApplicationController < ActionController::API
	include JsonWebToken
	before_action :authenticate_request
	private
	def authenticate_request
		token = request.headers["token"]
		decoded = jwt_decode(token)
		@current_user = Account.find(decoded[:account_id])
	end
end
