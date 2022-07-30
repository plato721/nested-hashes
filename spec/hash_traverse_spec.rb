require "./lib/hash_traverse"

RSpec.describe HashTraverse do
  describe "sum of numbers" do
    # Given a hash whose keys can point to arrays, hashes, strings,
    # or integers, and any of the arrays can contain all of the
    # above as well, write a function that will add up all the numbers
    # contained in the hash.
    it "does a simple one" do
      hash = {
        red: 5,
        blue: 9
      }
      result = described_class.new(hash).compute_sum
      expect(result).to eql(14)
    end

    it "does one with strings" do
      hash = {
        red: "white",
        something: 7,
        c: 2
      }
      result = described_class.new(hash).compute_sum
      expect(result).to eql(9)
    end

    it "does a nested one" do
      nested = {
        red: 5,
        blue: 9
      }
      hash = {
        red: "white",
        something: 7,
        d: nested,
        c: 2
      }
      result = described_class.new(hash).compute_sum
      expect(result).to eql(23)
    end

    it "handles an array" do
      nested = {
        red: 5,
        blue: 9
      }
      hash = {
        red: 5,
        purple: [5, "nothing here", nested, 1],
        blue: 9
      }
      result = described_class.new(hash).compute_sum
      expect(result).to eql(34)
    end

    it "go crazy" do
      a = {
        red: 5,
        blue: 9
      }
      b = {
        red: "white",
        something: 7,
        d: a,
        c: 2
      }
      c = {
        red: 5,
        purple: [5, "nothing here", b, 1],
        blue: { a: a, b: [a, a, "cheese", a]}
      }
      hash = {
        a: { b: { c: { q: c }}}
      }
      result = described_class.new(hash).compute_sum
      expect(result).to eql(90)
    end
  end
end
