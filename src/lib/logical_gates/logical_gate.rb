# frozen_string_literal: true

class LogicalGate
  def self.not(a)
    !a
  end

  def self.and(a, b, *others)
    return false if (others.include? false) || !a || !b
    true
  end

  def self.nand(a, b, *others)
    self.not self.and(a, b, others)
  end

  def self.or(a, b, *others)
    return true if others.include? true || a || b
    false
  end

  def self.nor(a, b, *others)
    self.not self.or(a, b, others)
  end

  def self.xor(a, b, *others)
    result = self.base_xor a, b
    others.each { |term| result = base_xor(result, term)}
    result
  end

  def self.xnor(a, b, *others)
    self.not self.xor(a, b, others)
  end

  private
  def self.base_xor(a, b)
    a ^ b
  end
end

class TrueClass
  def and(b, *others)
    LogicalGate.and(self, b, others)
  end
end
