# hack to stop false positives in corrective actions
class profile::eipp_hack {
  case $facts['kernel'] {
    'Linux': {
      cron {
        'eipp_hack':
          command => 'if [ -d /var/log/apt/eipp.log.gz ]; then chmod 0640 /var/log/apt/eipp.log.gz; fi',
          user    => 'root',
          minute  => '*',
          hour   => '*',
      }
    }
  }
}
