# installs grafana server
class profile::grafana_server {
  class { 'grafana':
    version => '14.1.0',
    install_method => 'repo',
  }
}
