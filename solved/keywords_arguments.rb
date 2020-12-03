@convert = {
  "celsius_fahrenheit" => ->(t) {(t*9.0/5.0) + 32},
  "fahrenheit_celsius" => ->(t) {(t-32) * 5.0/9.0},

  "celsius_kelvin" => ->(t) {t + 273.15},
  "kelvin_celsius" => ->(t) {t - 273.15},

  "kelvin_fahrenheit" => ->(t) {(t - 273.15) * 9.0/5.0 + 32},
  "fahrenheit_kelvin" => ->(t) {(t - 32) * 5.0/9.0 + 273.15},

  # Identity Functions
  "celsius_celsius" => ->(t) {t},
  "fahrenheit_fahrenheit" => ->(t) {t},
  "kelvin_kelvin" => ->() {t}
}

def convert_temp(temperature, **blah)
  @convert["#{blah[:input_scale]}_#{blah[:output_scale]}"].(temperature)
end
