module StringExt; end; module StringExt::StartsEndsWith
refine String do
#  alias_method :starts_with?, :start_with?
#  alias_method :ends_with?, :end_with?
end
end
