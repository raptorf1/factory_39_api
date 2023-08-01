module PriceService
  def self.calculcate_price_per_vehicle(postcode_from, prostcode_to, vehicle)
    calulation_algorithm = (((postcode_to.to_i(36) - postcode_from.to_i(36))).to_f/1000000).abs.round(2)

    case vehicle
    when "bicycle"
      calulation_algorithm
    when "small_car"
      calulation_algorithm * 1.25
    when "van"
      calulation_algorithm * 1.50
    when "lorry"
      calulation_algorithm * 2
    else
      "Error: unknown vehicle type!"
    end
  end
end
