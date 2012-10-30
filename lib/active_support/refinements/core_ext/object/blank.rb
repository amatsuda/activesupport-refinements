module ObjectExt; end; module ObjectExt::Blank
# encoding: utf-8

refine Object do
  # An object is blank if it's false, empty, or a whitespace string.
  # For example, '', '   ', +nil+, [], and {} are all blank.
  #
  # This simplifies:
  #
  #   if address.nil? || address.empty?
  #
  # ...to:
  #
  #   if address.blank?
  def blank?
    respond_to?(:empty?) ? empty? : !self
  end

  # An object is present if it's not <tt>blank?</tt>.
  def present?
    !blank?
  end

  # Returns object if it's <tt>present?</tt> otherwise returns +nil+.
  # <tt>object.presence</tt> is equivalent to <tt>object.present? ? object : nil</tt>.
  #
  # This is handy for any representation of objects where blank is the same
  # as not present at all. For example, this simplifies a common check for
  # HTTP POST/query parameters:
  #
  #   state   = params[:state]   if params[:state].present?
  #   country = params[:country] if params[:country].present?
  #   region  = state || country || 'US'
  #
  # ...becomes:
  #
  #   region = params[:state].presence || params[:country].presence || 'US'
  def presence
    self if present?
  end
end

refine NilClass do
  # +nil+ is blank:
  #
  #   nil.blank? # => true
  def blank?
    true
  end
end

refine FalseClass do
  # +false+ is blank:
  #
  #   false.blank? # => true
  def blank?
    true
  end
end

refine TrueClass do
  # +true+ is not blank:
  #
  #   true.blank? # => false
  def blank?
    false
  end
end

refine Array do
  # An array is blank if it's empty:
  #
  #   [].blank?      # => true
  #   [1,2,3].blank? # => false
#  alias_method :blank?, :empty?
end

refine Hash do
  # A hash is blank if it's empty:
  #
  #   {}.blank?                # => true
  #   { key: 'value' }.blank?  # => false
#  alias_method :blank?, :empty?
end

refine String do
  # A string is blank if it's empty or contains whitespaces only:
  #
  #   ''.blank?                 # => true
  #   '   '.blank?              # => true
  #   '　'.blank?               # => true
  #   ' something here '.blank? # => false
  def blank?
    self !~ /[^[:space:]]/
  end
end

refine Numeric do
  # No number is blank:
  #
  #   1.blank? # => false
  #   0.blank? # => false
  def blank?
    false
  end
end
end
