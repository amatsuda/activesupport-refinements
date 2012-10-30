#!/usr/bin/env ruby
require 'active_support/all'

Dir.chdir 'lib/active_support/refinements/core_ext' do
  Dir.glob('**/*.rb').each do |fn|
    f = File.read fn
    if f =~ /^\S*(class|module) [A-Z]/
      p fn
      # object/try.rb  =>  ObjectExt::Try
      # enumerable.rb  =>  EnumerableExt
      parent_module, child_module = fn.sub(/\.rb/, '').camelize.split('::')
      module_name = child_module ? "#{parent_module}Ext::#{child_module}" : "#{parent_module}Ext"
      # -class Object
      # +module Object::TryExt
      # +refine Object do
      body = f.gsub(/^(\s)*(?:class|module) (?!QualifiedConstUtils)([A-Z][^\s]*).*/) { "#{$1}refine #{$2.chomp} do" }

      File.open(fn, 'w') do |new_file|
        new_file.write <<-EOF
#{"module #{parent_module}Ext; end; " if child_module}module #{module_name}
#{body.sub(/\n\z/, '')}
end
EOF
      end
    end
  end
end
