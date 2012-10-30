require 'activesupport-refinements/version'

Dir[File.join(File.dirname(__FILE__), 'active_support/refinements/core_ext/*.rb')].sort.each do |path|
  next if File.basename(path, '.rb') == 'logger'
  require "active_support/refinements/core_ext/#{File.basename(path, '.rb')}"
end
