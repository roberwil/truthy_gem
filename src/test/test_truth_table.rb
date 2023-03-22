require 'minitest/autorun'
require_relative '../lib/ada_truthy'

class TestTruthTable < Minitest::Test
  describe "Truth table with 1 row has right formula" do
    t = TruthTable.new 2
    t.add_row 1, 1, 0

    expected = '(~A+~B)'
    actual   = t.to_s

    it "Formula should be #{expected}" do
      assert_equal expected, actual
    end
  end

  describe "Truth table with 2 rows has right formula" do
    t = TruthTable.new 2

    t.add_row 1, 1, 1
    t.add_row 1, 0, 1

    expected = '(A.B)+(A.~B)'
    actual   = t.to_s

    it "Formula should be #{expected}" do
      assert_equal expected, actual
    end
  end

  describe "Truth table of 2 with 1 row is valid" do
    [
      [true,  true,  false],
      [true,  false, true],
      [false, true,  true],
      [false, false, true]
    ].each do |boolean_set|

      a = boolean_set[0]
      b = boolean_set[1]

      t = TruthTable.new 2
      t.add_row 1, 1, 0

      actual   = t.check a, b
      expected = boolean_set[-1]

      it "#{boolean_set[..-2]} should be #{expected}" do
        assert_equal expected, actual
      end
    end
  end

  describe "Truth table of 2 with 4 rows is valid" do
    [
      [true,  true,  false],
      [true,  false, false],
      [false, true,  true],
      [false, false, true]
    ].each do |boolean_set|

      a = boolean_set[0]
      b = boolean_set[1]

      t = TruthTable.new 2
      t.add_row 1, 1, 0
      t.add_row 1, 0, 0
      t.add_row 0, 1, 1
      t.add_row 0, 0, 1

      actual   = t.check a, b
      expected = boolean_set[-1]

      it "#{boolean_set[..-2]} should be #{expected}" do
        assert_equal expected, actual
      end
    end
  end
end
