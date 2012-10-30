module RegexpExt
refine Regexp do
  def multiline?
    options & MULTILINE == MULTILINE
  end
end
end
