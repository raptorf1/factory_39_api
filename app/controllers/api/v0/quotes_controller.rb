class Api::V0::QuotesController < ApplicationController
  def create
    validate_params = ValidationService.validate_params(params[:from], params[:to], params[:vehicle])
    render json: { errors: validate_params }, status: 400 and return if !validate_params.empty?

    validate_postcodes = ValidationService.validate_postcodes(params[:from], params[:to])
    render json: { errors: validate_postcodes }, status: 400 and return if !validate_postcodes.empty?

    render json: {
             from: params[:from].strip,
             to: params[:to].strip,
             vehicle: params[:vehicle].strip,
             cost:
               PriceService.calculcate_price_per_vehicle(params[:from].strip, params[:to].strip, params[:vehicle].strip)
           },
           status: 200
  end
end
