module ModuleExt; end; module ModuleExt::Reachable
require 'active_support/refinements/core_ext/module/anonymous'
require 'active_support/refinements/core_ext/string/inflections'

refine Module do
  def reachable? #:nodoc:
    !anonymous? && name.safe_constantize.equal?(self)
  end
end
end
