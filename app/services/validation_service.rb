module ValidationService
  def self.validate_params(postcode_from, postcode_to, vehicle)
    errors_to_return = []

    errors_to_return.push("Origin postcode must be provided!") if postcode_from.blank?

    errors_to_return.push("Destination postcode must be provided!") if postcode_to.blank?

    errors_to_return.push("Vehicle type must be provided!") if vehicle.blank?

    errors_to_return
  end

  def self.validate_postcodes(postcode_from, postcode_to)
    errors_to_return = []
    validation_regexp = /^([A-Z][A-HJ-Y]?\d[A-Z\d]? ?\d[A-Z]{2}|GIR ?0A{2})$/

    if !postcode_from.strip.match?(validation_regexp)
      errors_to_return.push("Origin postcode is not a valid UK postcode!")
    end

    if !postcode_to.strip.match?(validation_regexp)
      errors_to_return.push("Destination postcode is not a valid UK postcode!")
    end

    errors_to_return
  end
end
