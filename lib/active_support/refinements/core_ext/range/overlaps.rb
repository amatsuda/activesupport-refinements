module RangeExt; end; module RangeExt::Overlaps
refine Range do
  # Compare two ranges and see if they overlap each other
  #  (1..5).overlaps?(4..6) # => true
  #  (1..5).overlaps?(7..9) # => false
  def overlaps?(other)
    cover?(other.first) || other.cover?(first)
  end
end
end
