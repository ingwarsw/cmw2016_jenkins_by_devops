require 'spec_helper'
describe 'jenkins_dsl' do

  context 'with defaults for all parameters' do
    it { should contain_class('jenkins_dsl') }
  end
end
