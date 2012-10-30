module StringExt; end; module StringExt::Strip
require 'active_support/refinements/core_ext/object/try'

refine String do
  # Strips indentation in heredocs.
  #
  # For example in
  #
  #   if options[:usage]
  #     puts <<-USAGE.strip_heredoc
  #       This command does such and such.
  #
  #       Supported options are:
  #         -h         This message
  #         ...
  #     USAGE
  #   end
  #
  # the user would see the usage message aligned against the left margin.
  #
  # Technically, it looks for the least indented line in the whole string, and removes
  # that amount of leading whitespace.
  def strip_heredoc
    indent = scan(/^[ \t]*(?=\S)/).min.try(:size) || 0
    gsub(/^[ \t]{#{indent}}/, '')
  end
end
end
