require 'spec_helper'

describe 'osx::finder::disable_desktop' do
  let(:facts) { {:boxen_user => 'ilikebees'} }

  it do
    should include_class('osx::finder')

    should contain_boxen__osx_defaults('Disable desktop').with({
      :key    => 'CreateDesktop',
      :domain => 'com.apple.finder',
      :value  => false,
      :notify => 'Exec[killall Finder]',
      :user   => facts[:boxen_user]
    })
  end
end
