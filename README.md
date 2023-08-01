# [Factory39](https://factory39.io/) Hiring Assignment

# Task

Implement a rest endpoint in a Ruby on Rails application that will give you a quote for shipping a package between two postcodes for a given vehicle

Example request:

```
{
"from": "EC2A 3LT",
"to": "NW8 8TE",
"vehicle": "bicycle"
}
```

Example Response

```
{
"from": "EC2A 3LT",
"to": "NW8 8TE",
"vehicle": "bicycle"
"cost": 667
}
```

## Allowed Vehicles / Cost multiplier

bicycle / 1

small_car / 1.25

van / 1.5

lorry / 2

## Hint Calculating cost for distance

The price we charge depends on the distance between two postcodes. We won't implement postcode geocoding here, so instead let's use a basic formula for working out the price for a quote between two postcodes. The process is to take the base-36 integer of each postcode, substract the delivery postcode from the pickup postcode and then divide by 1000. If the result is negative, turn it into a positive.

price = (((to_postcode.to_i(36) - from_postcode.to_i(36))).to_f/1000).abs.round(2)
