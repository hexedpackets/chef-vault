include_recipe 'vault::install'

template node[:vault][:server][:config] do
  mode '0600'
  owner 'root'
  group 'root'
  variables(backends: node[:vault][:server][:backends],
            listeners: node[:vault][:server][:listeners],
            statsite_addr: node[:vault][:server][:statsite_addr],
            statsd_addr: node[:vault][:server][:statsd_addr])
end

if node[:vault][:server][:init_type]
  include_recipe "vault::#{node[:vault][:server][:init_type]}"
end
