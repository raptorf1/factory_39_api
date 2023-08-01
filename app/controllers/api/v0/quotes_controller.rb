class Api::V0::QuotesController < ApplicationController
  def create
    if params[:from].nil? || params[:to].nil? || params[:vehicle].nil?
      render json: {
               errors: ["Both from and to postcodes and a vehicle type needed to calculate a cost!"]
             },
             status: 400 and return
    end

    render json: {
             from: params[:from],
             to: params[:to],
             vehicle: params[:vehicle],
             cost: PriceService.calculcate_price_per_vehicle(params[:from], params[:to], params[:vehicle])
           },
           status: 200
  end
end
