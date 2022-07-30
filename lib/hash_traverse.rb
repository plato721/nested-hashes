class HashTraverse
  def initialize(hash)
    @hash = hash
  end

  def compute_sum(current_part = @hash)
    if current_part.is_a? Array
      current_part.reduce(0) do |acc, v|
        acc + process_value(v)
      end
    else
      current_part.reduce(0) do |acc, (_, v)|
        acc + process_value(v)
      end
    end
  end

  private

  def process_value(v)
    return 0 if v.is_a? String
    return v if v.is_a? Numeric
    compute_sum(v)
  end
end
