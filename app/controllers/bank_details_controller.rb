class BankDetailsController < ApplicationController
  skip_before_action :authenticate_request
  def create
    band_detail = BankDetail.new(bank_detail_params)
    if band_detail.save
      render json: band_detail
    else
      render json: { messsage: "Bank Details not created" }
    end
  end

  def bank_detail_params
    params.permit(:bank_name, :account_number, :IFSC_code, :location, :owner_id, :bank_proof)
  end
end
