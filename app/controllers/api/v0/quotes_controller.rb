class Api::V0::QuotesController < ApplicationController
  def create
    render json: {
             from: params[:from],
             to: params[:to],
             vehicle: params[:vehicle],
             cost: PriceService.calculcate_price_per_vehicle(params[:from], params[:to], params[:vehicle])
           },
           status: 200
  end
end
