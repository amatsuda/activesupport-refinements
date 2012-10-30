module ExceptionExt
refine ActiveSupport do
  FrozenObjectError = RuntimeError
end
end
