require 'active_support/refinements/core_ext/object/try'

describe 'Object#try' do
  context 'when using ObjectExt::Try' do
    it 'an Object has #try method' do
      Module.new { using ObjectExt::Try }.module_eval { 'hello'.try(:reverse) }.should == 'olleh'
    end
    it 'nil has #try method' do
      Module.new { using ObjectExt::Try }.module_eval { nil.try(:to_s) }.should be_nil
    end
  end

  context 'when not using ObjectExt::Try' do
    it 'has no #try method' do
      expect { :hello.try(:to_s) }.to raise_error NoMethodError
    end
  end
end
