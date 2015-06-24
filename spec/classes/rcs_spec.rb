require_relative '../spec_helper'

describe 'rcs', :type => :class do

  it { is_expected.to compile.with_all_deps }
  it { is_expected.to contain_class('rcs::config') }

  context 'default parameters' do
    it do
      is_expected.to contain_file('/etc/default/rcS') \
        .with_content(/TMPTIME=0/)
        .with_content(/SULOGIN=NO/)
        .with_content(/DELAYLOGIN=NO/)
        .with_content(/UTC=YES/)
        .with_content(/VERBOSE=NO/)
        .with_content(/FSCKFIX=NO/)
    end
  end

  context 'tmptime is set to 7 days' do
    let(:params) {{
      :tmptime => '7',
    }}
    it do
      is_expected.to contain_file('/etc/default/rcS') \
        .with_content(/TMPTIME=7/)
    end
  end

  context 'sulogin is set to yes' do
    let(:params) {{
      :sulogin => 'yes',
    }}
    it do
      is_expected.to contain_file('/etc/default/rcS') \
        .with_content(/SULOGIN=yes/)
    end
  end

  context 'delaylogin is set to yes' do
    let(:params) {{
      :delaylogin => 'yes',
    }}
    it do
      is_expected.to contain_file('/etc/default/rcS') \
        .with_content(/DELAYLOGIN=yes/)
    end
  end

  context 'utc is set to no' do
    let(:params) {{
      :utc => 'no',
    }}
    it do
      is_expected.to contain_file('/etc/default/rcS') \
        .with_content(/UTC=no/)
    end
  end

  context 'verbose is set to yes' do
    let(:params) {{
      :verbose => 'yes'
    }}
    it do
      is_expected.to contain_file('/etc/default/rcS') \
        .with_content(/VERBOSE=yes/)
    end
  end

  context 'fsckfix is set to yes' do
    let(:params) {{
      :fsckfix => 'yes'
    }}
    it do
      is_expected.to contain_file('/etc/default/rcS') \
        .with_content(/FSCKFIX=yes/)
    end
  end

end

