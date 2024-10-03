# install prometheus client
class profile::promt_client {
  class { 'prometheus::node_exporter':
    version => '1.8.2',
  }
}
