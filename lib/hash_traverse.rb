class HashTraverse
  def initialize(hash)
    @hash = hash
  end

  def compute_sum(current_part = @hash)
    if current_part.is_a? Array
      current_part.reduce(0) do |acc, v|
        process_value(acc, v)
      end
    else
      current_part.reduce(0) do |acc, (_, v)|
        process_value(acc, v)
      end
    end
  end

  private

  def process_value(acc, v)
    return acc if v.is_a? String
    return acc + v if v.is_a? Numeric
    acc + compute_sum(v)
  end
end
