###############################################################################
# User-specified values
###############################################################################
default[:vault][:bin_dir] = '/usr/local/bin'
default[:vault][:version] = '0.2.0'
default[:vault][:mode] = 'client'

###############################################################################
# Server attributes
###############################################################################
default[:vault][:server][:config] = '/etc/vault.hcl'
default[:vault][:server][:service_name] = 'vault'
default[:vault][:server][:init_type] = 'upstart' # Set to nil or false to disable.
default[:vault][:server][:log_level] = 'info'
default[:vault][:server][:statsite_addr] = nil
default[:vault][:server][:statsd_addr] = nil

# Setting to a falsey value will disable putting the OOM score in the upstart scripts
default[:vault][:server][:oom_score] = value_for_platform(
  %w(amazon debian ubuntu) => {
    'default' => -100
  },
  %w(redhat centos) => {
    'default' => nil
  },
  'default' => -100
)

# https://vaultproject.io/docs/config/index.html#backend
default[:vault][:server][:backends] = {
  consul: {
    address: 'demo.consul.io:80',
    path: 'vault'
  }
}

# https://vaultproject.io/docs/config/index.html#listener
default[:vault][:server][:listeners] = {
  tcp: {
    address: '127.0.0.1:8200',
    tls_cert_file: '/etc/ssl/certificate.crt',
    tls_key_file: '/etc/ssl/key.pem'
  }
}

###############################################################################
# Derived values, not meant to be manually set
###############################################################################
default[:vault][:zip_file] = "vault_#{node[:vault][:version]}_linux_amd64.zip"
default[:vault][:download_url] = "https://dl.bintray.com/mitchellh/vault/#{node[:vault][:zip_file]}"
