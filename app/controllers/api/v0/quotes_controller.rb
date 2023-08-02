class Api::V0::QuotesController < ApplicationController
  def create
    validate_params = ValidationService.validate_params(params[:from], params[:to], params[:vehicle])
    render json: { errors: validate_params }, status: 400 and return if !validate_params.empty?

    validate_postcodes = ValidationService.validate_postcodes(params[:from], params[:to])
    render json: { errors: validate_postcodes }, status: 400 and return if !validate_postcodes.empty?

    render json: {
             from: params[:from],
             to: params[:to],
             vehicle: params[:vehicle],
             cost: PriceService.calculcate_price_per_vehicle(params[:from], params[:to], params[:vehicle])
           },
           status: 200
  end
end
