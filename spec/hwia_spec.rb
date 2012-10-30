require 'active_support/refinements/core_ext/hash/indifferent_access'

describe 'Hash#with_indifferent_access' do
  context 'when using HashExt::IndifferentAccess' do
    it 'a Hash has #with_indifferent_access method' do
      Module.new { using HashExt::IndifferentAccess }.module_eval { {a: 1}.with_indifferent_access['a'] }.should == 1
    end
  end

  context 'when not using HashExt::IndifferentAccess' do
    it 'has no #try method' do
      expect { {a: 1}.with_indifferent_access }.to raise_error NoMethodError
    end
  end
end
