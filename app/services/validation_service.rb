module ValidationService
  def self.validate_params(postcode_from, postcode_to, vehicle)
    errors_to_return = []

    errors_to_return.push("Origin postcode must be provided!") if postcode_from.blank?

    errors_to_return.push("Destination postcode must be provided!") if postcode_to.blank?

    errors_to_return.push("Vehicle type must be provided!") if vehicle.blank?

    errors_to_return
  end
end
