require 'activesupport-refinements/version'
# need to load this in advance, because Module#remove_method is heavily used in AS
require 'active_support/core_ext/module/remove_method'

# requiring all core_exts ends up with requiring many modules from the original AS. Commenting out for now
# Dir[File.join(File.dirname(__FILE__), 'active_support/refinements/core_ext/*.rb')].sort.each do |path|
#   next if File.basename(path, '.rb') == 'logger'
#   require "active_support/refinements/core_ext/#{File.basename(path, '.rb')}"
# end
