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



end

class TrueClass
  def and(b, *others)
    LogicalGate.and(self, b, others)
  end
end
