module StringExt; end; module StringExt::Inquiry
require 'active_support/string_inquirer'

refine String do
  # Wraps the current string in the <tt>ActiveSupport::StringInquirer</tt> class,
  # which gives you a prettier way to test for equality.
  #
  #   env = 'production'.inquiry
  #   env.production?  # => true
  #   env.development? # => false
  def inquiry
    ActiveSupport::StringInquirer.new(self)
  end
end
end
