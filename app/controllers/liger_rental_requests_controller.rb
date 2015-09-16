class LigerRentalRequestsController < ApplicationController
  def new
    @liger_rental_request = LigerRentalRequest.new
    @ligers = Liger.all
    render :new
  end

  def create
    @liger_rental_request = LigerRentalRequest.new(liger_rental_request_params)
    @ligers = Liger.all
    if @liger_rental_request.save
      redirect_to liger_rental_request_url(@liger_rental_request)
    else
      render :new
    end
  end

  def show
    @liger_rental_request = LigerRentalRequest.find(params[:id])
    @liger = Liger.find(@liger_rental_request.liger_id)
    render :show
  end

  def approve
    @liger_rental_request = LigerRentalRequest.find(params[:id])
    @liger_rental_request.approve!
    redirect_to liger_rental_request_url(@liger_rental_request)
  end

  def deny
    @liger_rental_request = LigerRentalRequest.find(params[:id])
    @liger_rental_request.deny!
    redirect_to liger_rental_request_url(@liger_rental_request)
  end


  private
  def liger_rental_request_params
    params.require(:liger_rental_request).permit(:start_date, :end_date, :liger_id)
  end
end
