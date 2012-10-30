module DateExt; end; module DateExt::ActsLike
require 'active_support/refinements/core_ext/object/acts_like'

refine Date do
  # Duck-types as a Date-like class. See Object#acts_like?.
  def acts_like_date?
    true
  end
end
end
