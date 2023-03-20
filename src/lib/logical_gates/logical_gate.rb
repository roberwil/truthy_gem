class LogicalGate
  def self.not(a)
    return inot(a) if a.is_a? Integer
    return !a
  end

  def self.and(a, b, *others)
    return self.iand(a, b, others) if a.is_a? Integer
    return false if (others.include?(false) || !a || !b)
    return true
  end

  def self.nand(a, b, *others)
    self.not self.and(a, b, others)
  end

  def self.or(a, b, *others)
    return self.ior(a, b, others) if a.is_a? Integer
    return true if others.include?(true) || a || b
    return false
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

  def self.to_bool(a)
    a == 1? true : false
  end

  def self.inot(a)
    self.not self.to_bool(a)
  end

  def self.iand(a, b, *others)
    return false if others.include?(0) || a == 0 || b == 0
    return true
  end

  def self.ior(a, b, *others)
    return true if others.include?(1) || a == 1 || b == 1
    return false
  end
end
