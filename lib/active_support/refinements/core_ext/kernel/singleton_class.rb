module KernelExt; end; module KernelExt::SingletonClass
refine Kernel do
  # class_eval on an object acts like singleton_class.class_eval.
  def class_eval(*args, &block)
    singleton_class.class_eval(*args, &block)
  end
end
end
