#!/usr/bin/env ruby
require 'active_support/all'

AS_SRC = '~/src/rails/activesupport'

core_ext_dir = File.join File.dirname(__FILE__), 'lib/active_support/refinements/core_ext'

# copy AS src
`rm -rf #{core_ext_dir} && mkdir -p #{core_ext_dir} && cp -R #{AS_SRC}/lib/active_support/core_ext/ #{core_ext_dir}`

Dir.chdir core_ext_dir do
  Dir.glob('**/*.rb').each do |fn|
    next if ['date_and_time/calculations.rb',  # nested modules
             'object/to_json.rb',  # defines a new module
             'string/output_safety.rb',  # defines a new class
             'module/aliasing.rb'  # aliases
      ].include? fn
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
      # alias doesn't work inside Refinements
      body = body.gsub(/^( *alias.*)/) { "##{$1}" }

      File.open(fn, 'w') do |new_file|
        new_file.write <<-EOF
#{"module #{parent_module}Ext; end; " if child_module}module #{module_name}
#{body.sub(/\n\z/, '')}
end
EOF
      end
    end

    # -require 'active_support/core_ext/object/blank'
    # +require 'active_support/refinements/core_ext/object/blank'
    `sed -i '' "s/require 'active_support\\\/core_ext\\\//require 'active_support\\\/refinements\\\/core_ext\\\//" *.rb **/*.rb`
  end
end
