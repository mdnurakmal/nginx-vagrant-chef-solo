nginx_install 'nginx' do
  source 'repo'
end

nginx_config 'nginx' do
  action :create
  notifies :reload, 'nginx_service[nginx]', :delayed
end

directory '/var/www/html' do
  owner 'vagrant'
  group 'vagrant'
  mode '0755'
  recursive true
  action :create
end

cookbook_file '/var/www/html/index.html' do
  source 'index.html'
  owner 'vagrant'
  group 'vagrant'
  mode '0755'
  action :create
end

nginx_site 'test_site' do
  mode '0644'

  variables(
    'server' => {
      'listen' => [ '*:80' ],
      'server_name' => [ 'test_site' ],
      'access_log' => '/var/log/nginx/test_site.access.log',
      'locations' => {
        '/' => {
          'root' => '/var/www/nginx-default',
          'index' => 'index.html index.htm',
        },
      },
    }
  )

  action :create
  notifies :reload, 'nginx_service[nginx]', :delayed
end

nginx_service 'nginx' do
  action :enable
  delayed_action :start
end
