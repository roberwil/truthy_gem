require_relative '../logical_gates/logical_gate_extension'

class TruthTable
  @@letters = %w[A B C D E F G H I J]

  @@combinations = {
    2 =>  04, 3 =>   8,  4 =>   16,
    5 =>  32, 6 =>  64,  7 =>  128,
    8 => 256, 9 => 512, 10 => 1024
  }

  MAX_LIMIT   = 6
  MIN_LIMIT   = 2
  SELF        = 'S'
  COMPLEMENT  = 'C'
  TRUE_VALUE  = 'T'
  FALSE_VALUE = 'F'


  def initialize(number_of_terms)
    case number_of_terms
    when number_of_terms > MAX_LIMIT
      raise TruthyException, "The maximum number of terms is #{MAX_LIMIT}"
    when number_of_terms < MIN_LIMIT
      raise TruthyException, "The minimum number of terms is #{MIN_LIMIT}"
    end

    @number_of_terms = number_of_terms
    @number_of_combinations = @@combinations[number_of_terms]

    @cache   = Hash.new
    @formula = Array.new
    @rows    = Array.new

    @using_sum_of_products = true
    @using_product_of_sums = false

    @number_of_zeros = 0
    @number_of_ones  = 0
  end

  def add_row(*terms)
  end

  def check(*terms)
  end

  def to_s
    super
  end

  private

  def row_is_valid?(row)
    @rows.each do |existing_row|
      is_equal = true

      (0..existing_row.size - 1).each do |i|
        is_equal = is_equal.and(row[i] == existing_row[i])
      end

      return false if is_equal
    end

    return true
  end

  def compute(row)
    row_output = row[-1]

    return if @using_sum_of_products.and(row_output != 1)
    return if @using_product_of_sums.and(row_output != 0)

    (0..row.size - 1).each do |i|
      if @using_sum_of_products
        @formula << (row[i] == 1)? SELF : COMPLEMENT
      else
        @formula << (row[i] == 1)? COMPLEMENT : SELF
      end
    end
  end

  def change_algorithm_if_needed
    no_need_to_change = @using_sum_of_products.and(@number_of_zeros == 0).
      or(@using_product_of_sums.and(@number_of_ones == 0))

    return if no_need_to_change

    more_zeros = @number_of_zeros >= @number_of_ones

    no_need_to_change = @using_sum_of_products.and(more_zeros).
      or(@using_product_of_sums.and(!more_zeros))

    return if no_need_to_change

    more_zeros ? use_sum_of_products : use_product_of_sums

    @formula = []
    @cache   = []

    @rows.each do |row|
      compute row
    end
  end

  def self.get_row_cache_code(*terms)
    code = ''
    terms.each { |term| code += term ? TRUE_VALUE : FALSE_VALUE }
    return code
  end

  def use_sum_of_products
    @using_sum_of_products = true
    @using_product_of_sums = false
  end

  def use_product_of_sums
    @using_sum_of_products = false
    @using_product_of_sums = true
  end
end
