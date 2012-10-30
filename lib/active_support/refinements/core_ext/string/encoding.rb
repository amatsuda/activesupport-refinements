module StringExt; end; module StringExt::Encoding
require 'active_support/deprecation'

refine String do
  def encoding_aware?
    ActiveSupport::Deprecation.warn 'String#encoding_aware? is deprecated', caller
    true
  end
end
end
