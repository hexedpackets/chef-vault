template "/etc/init/#{node[:vault][:server][:service_name]}.conf" do
  source 'vault.conf.erb'
  mode '0600'
  owner 'root'
  group 'root'
end

service node[:vault][:server][:service_name] do
  provider Chef::Provider::Service::Upstart
  supports status: true, restart: true, reload: true
  action [:start]
end
