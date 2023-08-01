module PriceService
  def self.calculcate_price_per_vehicle(postcode_from, postcode_to, vehicle)
    calulation_algorithm = (((postcode_to.to_i(36) - postcode_from.to_i(36))).to_f / 1_000).abs.round(2)

    case vehicle
    when "bicycle"
      calulation_algorithm.to_i
    when "small_car"
      (calulation_algorithm * 1.25).to_i
    when "van"
      (calulation_algorithm * 1.50).to_i
    when "lorry"
      (calulation_algorithm * 2).to_i
    else
      "For the type of transport: #{vehicle}, please speak with one of our representatives."
    end
  end
end
