module DateTimeExt; end; module DateTimeExt::ActsLike
require 'active_support/refinements/core_ext/object/acts_like'

refine DateTime do
  # Duck-types as a Date-like class. See Object#acts_like?.
  def acts_like_date?
    true
  end

  # Duck-types as a Time-like class. See Object#acts_like?.
  def acts_like_time?
    true
  end
end
end
