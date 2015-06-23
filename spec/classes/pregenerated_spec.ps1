require 'spec_helper'
describe 'rcs' do

  context 'with defaults for all parameters' do
    it { should contain_class('rcs') }
  end
end
