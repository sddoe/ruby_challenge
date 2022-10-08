# frozen_string_literal: true

# module to parse the input and save the values in a hash
module Input
  def self.parse(str)
    output = {}
    output[:quantity] = str.split.first
    parts = str.split(/ at /)
    output[:price] = parts.last.strip
    output[:name] = parts.first.split(output[:quantity]).last.strip
    output
  end
end
