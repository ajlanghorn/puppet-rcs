require_relative '../spec_helper'

describe 'rcs::config', :type => :class do

  it { should contain_file('/etc/default/rcS').with_ensure('present') }

end
