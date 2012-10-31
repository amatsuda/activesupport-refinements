module TimeExt; end; module TimeExt::ActsLike
require 'active_support/refinements/core_ext/object/acts_like'

refine Time do
  # Duck-types as a Time-like class. See Object#acts_like?.
  def acts_like_time?
    true
  end
end
end
