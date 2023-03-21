
class TruthTable
  @@letters = %w[A B C D E F G H I J]

  @@combinations = {
    02 => 004, 03 => 008, 04 => 0016,
    05 => 032, 06 => 064, 07 => 0128,
    08 => 256, 09 => 512, 10 => 1024
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
      is_equal = true;

      (0..existing_row.size - 1).each do |i|
        is_equal = is_equal.And(row[i] == existing_row[i])
      end

      return false if is_equal
    end

    return true
  end

  def compute(row)
  end

  def change_algorithm_if_needed
  end

  def self.get_row_cache_code(*terms)
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
