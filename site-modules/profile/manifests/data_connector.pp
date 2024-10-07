# data connector 
class profile::data_connector {
  class { 'puppet_data_connector':
    dropzone => '/opt/puppetlabs/puppet/puppet_data_connector',
  }
}
