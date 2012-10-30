module StringExt; end; module StringExt::Behavior
refine String do
  # Enable more predictable duck-typing on String-like classes. See <tt>Object#acts_like?</tt>.
  def acts_like_string?
    true
  end
end
end
