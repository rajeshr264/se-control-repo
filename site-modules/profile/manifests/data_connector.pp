  
  class profile::data_connector {
    class { "puppet_data_connector":
      dropzone => "/opt/puppetlabs/puppet/puppet_data_connector",
      metric_filter => ["events","time"], # optional
      events_filter => ["success"], # optional
    }
  }