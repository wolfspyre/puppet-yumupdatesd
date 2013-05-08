require 'spec_helper'

describe 'yumupdatesd', :type => :class do
  #debug to see catalog
  #  it { p subject.resources }
  context "On a RedHat OS" do
    let :facts do
      { :osfamily => 'RedHat' }
    end
    let :params do
      { :package_name => 'yum-updatesd',
        :service_name => 'yum-updatesd'}
    end
    ['present', 'enabled', 'active'].each do |yesplease|
      context "when ensure has the value '#{yesplease}'" do
        it {
          if ((yesplease == 'enabled') or (yesplease == 'active') or (yesplease == 'present'))
            should contain_service('yum-updatesd')
          else
            should_not contain_service('yum-updatesd')
          end
        }
        it { should contain_package('yum-updatesd') }
      end
    end
    it { should include_class('yumupdatesd::config') }
    it { should include_class('yumupdatesd::package') }
    it { should include_class('yumupdatesd::service') }
  end
end
