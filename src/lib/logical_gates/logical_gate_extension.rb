require_relative 'logical_gate'

class TrueClass
  def not
    LogicalGate.not self
  end

  def or(b, *others)
    LogicalGate.or self, b, others
  end

  def nor(b, *others)
    LogicalGate.nor self, b, others
  end

  def and(b, *others)
    LogicalGate.and self, b, others
  end

  def nand(b, *others)
    LogicalGate.nand self, b, others
  end

  def xor(b, *others)
    LogicalGate.xor self, b, others
  end

  def xnor(b, *others)
    LogicalGate.xnor self, b, others
  end
end

class FalseClass
  def not
    LogicalGate.not self
  end

  def or(b, *others)
    LogicalGate.or self, b, others
  end

  def nor(b, *others)
    LogicalGate.nor self, b, others
  end

  def and(b, *others)
    LogicalGate.and self, b, others
  end

  def nand(b, *others)
    LogicalGate.nand self, b, others
  end

  def xor(b, *others)
    LogicalGate.xor self, b, others
  end

  def xnor(b, *others)
    LogicalGate.xnor self, b, others
  end
end

class Integer
  def not
    LogicalGate.not self
  end

  def or(b, *others)
    LogicalGate.or self, b, others
  end

  def and(b, *others)
    LogicalGate.and self, b, others
  end
end
