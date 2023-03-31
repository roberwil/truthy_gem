require_relative 'truthy_exception'
require_relative '../logical_gates/logical_gate_extension'

module AdaTruthy
  class TruthTable
    @@letters = %w[A B C D E F G H I J]

    @@combinations = {
      2 => 04, 3 => 8, 4 => 16,
      5 => 32, 6 => 64, 7 => 128,
      8 => 256, 9 => 512, 10 => 1024
    }

    MAX_LIMIT = 6
    MIN_LIMIT = 2
    SELF = 'S'
    COMPLEMENT = 'C'
    TRUE_VALUE = 'T'
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

      @cache = Hash.new
      @formula = Array.new
      @rows = Array.new

      @using_sum_of_products = true
      @using_product_of_sums = false

      @number_of_zeros = 0
      @number_of_ones = 0
    end

    def add_row(*terms)
      table_has_enough_rows = @rows.size == @number_of_combinations

      if table_has_enough_rows
        raise TruthyException, "There should be only #{@number_of_combinations} rows."
      end

      right_number_of_terms = terms.size == @number_of_terms + 1

      unless right_number_of_terms
        raise TruthyException, "There should be only #{@number_of_terms} terms."
      end

      row = terms

      unless row_is_valid? row
        raise TruthyException, "The combination #{row} has been used already."
      end

      @cache = {}

      row_output = row[-1]
      change_algorithm = (@rows.size == 0).and(row_output == 0)

      use_product_of_sums if change_algorithm

      @rows << row
      (row_output == 1) ? @number_of_ones += 1 : @number_of_zeros += 1

      compute row
    end

    def check(*terms)
      has_right_number_of_terms = terms.size == @number_of_terms

      unless has_right_number_of_terms
        raise TruthyException, "There should be only #{@number_of_terms} terms."
      end

      change_algorithm_if_needed

      cache_code = TruthTable.get_row_cache_code terms
      cache_result = @cache[cache_code]

      return cache_result unless cache_result.nil?

      terms_cursor = 0
      partial_result = true
      result = false

      if @using_product_of_sums
        partial_result = false
        result = true
      end

      @formula.each do |t|
        if @using_sum_of_products
          partial_result = (t == SELF ? partial_result.and(terms[terms_cursor]) :
                              partial_result.and(!terms[terms_cursor]))
        else
          partial_result = (t == SELF ? partial_result.or(terms[terms_cursor]) :
                              partial_result.or(!terms[terms_cursor]))
        end

        terms_cursor += 1
        next if terms_cursor != @number_of_terms
        terms_cursor = 0

        if (@using_sum_of_products)
          return true if partial_result
          result = result.or(partial_result)
          partial_result = true
        else
          return false if not partial_result
          result = result.and(partial_result)
          partial_result = false
        end
      end

      @cache[cache_code] = result
      return result
    end

    def to_s
      terms_cursor = 0
      partial_result = ''
      result = ''

      @formula.each do |t|
        if @using_sum_of_products
          partial_result += (t == SELF ? "#{@@letters[terms_cursor]}." : "~#{@@letters[terms_cursor]}.")
        else
          partial_result += (t == SELF ? "#{@@letters[terms_cursor]}+" : "~#{@@letters[terms_cursor]}+")
        end

        terms_cursor += 1
        next if terms_cursor != @number_of_terms
        terms_cursor = 0

        result += (@using_sum_of_products ? "(#{partial_result[0...-1]})+" : "(#{partial_result[0...-1]}).")
        partial_result = ''
      end

      result[0...-1]
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

      (0...row.size - 1).each do |i|
        if @using_sum_of_products
          @formula << (row[i] == 1 ? SELF : COMPLEMENT)
        else
          @formula << (row[i] == 1 ? COMPLEMENT : SELF)
        end
      end
    end

    def change_algorithm_if_needed
      no_need_to_change = @using_sum_of_products.and(@number_of_zeros == 0).
        or(@using_product_of_sums.and(@number_of_ones == 0))

      return if no_need_to_change

      more_zeros = @number_of_zeros > @number_of_ones

      no_need_to_change = @using_sum_of_products.and(more_zeros).
        or(@using_product_of_sums.and(!more_zeros))

      return if no_need_to_change

      more_zeros ? use_sum_of_products : use_product_of_sums

      @formula = []
      @cache = {}

      @rows.each do |row|
        compute row
      end
    end

    def use_sum_of_products
      @using_sum_of_products = true
      @using_product_of_sums = false
    end

    def use_product_of_sums
      @using_sum_of_products = false
      @using_product_of_sums = true
    end

    def self.get_row_cache_code(terms)
      code = ''
      terms.each { |term| code += (term ? TRUE_VALUE : FALSE_VALUE) }
      return code
    end
  end
end
