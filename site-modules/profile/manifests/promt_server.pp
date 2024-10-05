# install prometheus server
class profile::promt_server {
  class { 'prometheus::server':
    version        => '2.54.1',
    include_default_scrape_configs => false,
    alerts         => {
      'groups' => [
        {
          'name'  => 'alert.rules',
          'rules' => [
            {
              'alert'       => 'InstanceDown',
              'expr'        => 'up == 0',
              'for'         => '5m',
              'labels'      => {
                'severity' => 'page',
              },
              'annotations' => {
                'summary'     => 'Instance {{ $labels.instance }} down',
                'description' => '{{ $labels.instance }} of job {{ $labels.job }} has been down for more than 5 minutes.'
              }
            },
          ],
        },
      ],
    },
    scrape_configs => [
      {
        'job_name'        => 'Puppet-Enterprise',
        'scrape_interval' => '10s',
        'scrape_timeout'  => '10s',
        'static_configs'  => [
          {
            'targets' => ['pe2023.harshamlab.site:9090'],
            'labels'  => {
              'alias' => 'pe2023',
            },
          },
        ],
      },
    ],
  }
}
