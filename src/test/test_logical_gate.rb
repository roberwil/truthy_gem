require 'minitest/spec'
require 'minitest/autorun'
require_relative '../lib/ada_truthy'

class LogicalGateTest < Minitest::Test
  describe "NOT Gate is valid" do
    [
      [true,  false],
      [false, true]
    ].each do |b|
      a = b[0]

      actual   = LogicalGate.not a
      expected = b[-1]

      it "#{b[0]} should be #{expected}" do
        assert_equal expected, actual
      end
    end
  end

  # OR and NOR gates here

  describe "OR Gate is valid with two inputs" do
    [
      [true,  true,  true],
      [true,  false, true],
      [false, true,  true],
      [false, false, false]
    ].each do |boolean_set|

      a = boolean_set[0]
      b = boolean_set[1]

      #actual   = LogicalGate.or(a, b)
      actual   = a.or(b)
      expected = boolean_set[-1]

      it "#{boolean_set[..-2]} should be #{expected}" do
        assert_equal expected, actual
      end
    end
  end

  describe "OR Gate is valid with three inputs" do
    [
      [true,  true,  true,  true],
      [true,  false, false, true],
      [false, true,  true,  true],
      [false, false, false, false]
    ].each do |boolean_set|

      a = boolean_set[0]
      b = boolean_set[1]

      actual   = LogicalGate.or(a, b, boolean_set[2..-2].first)
      expected = boolean_set[-1]

      it "#{boolean_set[..-2]} should be #{expected}" do
        assert_equal expected, actual
      end
    end
  end

  describe "NOR Gate is valid with two inputs" do
    [
      [true,  true,  false],
      [true,  false, false],
      [false, true,  false],
      [false, false, true]
    ].each do |boolean_set|

      a = boolean_set[0]
      b = boolean_set[1]

      actual   = LogicalGate.nor(a, b)
      expected = boolean_set[-1]

      it "#{boolean_set[..-2]} should be #{expected}" do
        assert_equal expected, actual
      end
    end
  end

  describe "NOR Gate is valid with three inputs" do
    [
      [true,  true,  true,  false],
      [true,  false, false, false],
      [false, true,  true,  false],
      [false, false, false, true]
    ].each do |boolean_set|

      a = boolean_set[0]
      b = boolean_set[1]

      actual   = LogicalGate.nor(a, b, boolean_set[2..-2].first)
      expected = boolean_set[-1]

      it "#{boolean_set[..-2]} should be #{expected}" do
        assert_equal expected, actual
      end
    end
  end

  # AND and NAND gates here

  describe "AND Gate is valid with two inputs" do
    [
      [true,  true,  true],
      [true,  false, false],
      [false, true,  false],
      [false, false, false]
    ].each do |boolean_set|

      a = boolean_set[0]
      b = boolean_set[1]

      actual   = LogicalGate.and(a, b)
      expected = boolean_set[-1]

      it "#{boolean_set[..-2]} should be #{expected}" do
        assert_equal expected, actual
      end
    end
  end

  describe "AND Gate is valid with three inputs" do
    [
      [true,  true,  true,  true],
      [true,  false, false, false],
      [false, true,  true,  false],
      [false, false, false, false]
    ].each do |boolean_set|

      a = boolean_set[0]
      b = boolean_set[1]

      actual   = LogicalGate.and(a, b, boolean_set[2..-2].first)
      expected = boolean_set[-1]

      it "#{boolean_set[..-2]} should be #{expected}" do
        assert_equal expected, actual
      end
    end
  end

  describe "NAND Gate is valid with two inputs" do
    [
      [true,  true,  false],
      [true,  false, true],
      [false, true,  true],
      [false, false, true]
    ].each do |boolean_set|

      a = boolean_set[0]
      b = boolean_set[1]

      actual   = LogicalGate.nand(a, b)
      expected = boolean_set[-1]

      it "#{boolean_set[..-2]} should be #{expected}" do
        assert_equal expected, actual
      end
    end
  end

  describe "NAND Gate is valid with three inputs" do
    [
      [true,  true,  true,  false],
      [true,  false, false, true],
      [false, true,  true,  true],
      [false, false, false, true]
    ].each do |boolean_set|

      a = boolean_set[0]
      b = boolean_set[1]

      actual   = LogicalGate.nand(a, b, boolean_set[2..-2].first)
      expected = boolean_set[-1]

      it "#{boolean_set[..-2]} should be #{expected}" do
        assert_equal expected, actual
      end
    end
  end

  # XOR and XNOR gates

  describe "XOR Gate is valid with two inputs" do
    [
      [true,  true,  false],
      [true,  false, true],
      [false, true,  true],
      [false, false, false]
    ].each do |boolean_set|

      a = boolean_set[0]
      b = boolean_set[1]

      actual   = LogicalGate.xor(a, b)
      expected = boolean_set[-1]

      it "#{boolean_set[..-2]} should be #{expected}" do
        assert_equal expected, actual
      end
    end
  end

  describe "XOR Gate is valid with three inputs" do
    [
      [true,  true,  true,  true],
      [true,  false, false, true],
      [false, true,  true,  false],
      [false, false, false, false]
    ].each do |boolean_set|

      a = boolean_set[0]
      b = boolean_set[1]

      actual   = LogicalGate.xor(a, b, boolean_set[2..-2].first)
      expected = boolean_set[-1]

      it "#{boolean_set[..-2]} should be #{expected}" do
        assert_equal expected, actual
      end
    end
  end

  describe "XNOR Gate is valid with two inputs" do
    [
      [true,  true,  true],
      [true,  false, false],
      [false, true,  false],
      [false, false, true]
    ].each do |boolean_set|

      a = boolean_set[0]
      b = boolean_set[1]

      actual   = LogicalGate.xnor(a, b)
      expected = boolean_set[-1]

      it "#{boolean_set[..-2]} should be #{expected}" do
        assert_equal expected, actual
      end
    end
  end

  describe "XNOR Gate is valid with three inputs" do
    [
      [true,  true,  true,  false],
      [true,  false, false, false],
      [false, true,  true,  true],
      [false, false, false, true]
    ].each do |boolean_set|

      a = boolean_set[0]
      b = boolean_set[1]

      actual   = LogicalGate.xnor(a, b, boolean_set[2..-2].first)
      expected = boolean_set[-1]

      it "#{boolean_set[..-2]} should be #{expected}" do
        assert_equal expected, actual
      end
    end
  end

end
