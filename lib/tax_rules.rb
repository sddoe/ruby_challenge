# frozen_string_literal: true

# module to store all of the tax rules
module TaxRules
  def self.rules
    @rules ||= []
  end

  def self.add_rules(object)
    rules << object
  end
end
