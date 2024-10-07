# in
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
        'job_name'        => 'prometheus',
        'scrape_interval' => '10s',
        'scrape_timeout'  => '10s',
        'static_configs'  => [
          {
            'targets' => ['localhost:9090'],
            'labels'  => {
              'alias' => 'Prometheus',
            },
          },
        ],
      },
      {
        'job_name'        => 'node',
        'scrape_interval' => '30s',
        'scrape_timeout'  => '30s',
        'static_configs'  => [
          {
            'targets' => ['pe2023.harshamlab.site:9100'],
            'labels'  => { 'alias' => 'pe2023.harshamlab.site' },
          },
        ],
      },
    ],
  }
}
