#module to store all of the tax rules
module TaxRules
  def self.rules
    @@rules ||= []
  end

  private
  def self.add_rules(class)
    rules << class
  end
end
