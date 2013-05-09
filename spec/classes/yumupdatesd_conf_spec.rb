require 'spec_helper'

describe 'yumupdatesd', :type => :class do
  #debug to see catalog
  #  it { p subject.resources }
  let :default_params do
    {
      :config_file  => '/etc/yum/yum-updatesd.conf',
      :package_name => 'yum-updatesd',
      :service_name => 'yum-updatesd',
    }
  end
  context "On a RedHat OS" do
    let :params do default_params end
    let :facts do
      { :osfamily => 'RedHat' }
    end
    ['present', 'active'].each do |yesplease|
      context "when ensure has the value '#{yesplease}' (Coverage testing)" do
        let :params do default_params.merge({ :ensure => yesplease }) end
        it { should contain_file('/etc/yum/yum-updatesd.conf') }
      end
    end
    context "When ensure has the value of 'enabled' (Granular testing)" do
      let :params do default_params.merge({ :ensure => 'enabled' }) end
      it { should contain_file('/etc/yum/yum-updatesd.conf') }
    end
  end
end
