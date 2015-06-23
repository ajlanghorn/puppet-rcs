require_relative '../spec_helper'

describe 'rcs', :type => :class do

  it { is_expected.to compile.with_all_deps }
  it { is_expected.to contain_class('rcs::config') }

  context 'default parameters' do
    let (:params) {{ }}

    it do
      is_expected.to contain_file('/etc/default/rcS') \
        .with_content(/TMPTIME=0/)
        .with_content(/SULOGIN=NO/)
        .with_content(/DELAYLOGIN=NO/)
        .with_content(/UTC=YES/)
        .with_content(/VERBOSE=NO/)
        .with_content(/FSCKFIX=/)
    end
  end

describe 'tmptime' do
  context 'setting TMPTIME to 7 days' do
    let (:params {{
      :tmptime => '7',
    }}

    it do
      is_expected.to contain_file('/etc/default/rcS') \
        .with_content(/TMPTIME=7/)
    end
  end
end
