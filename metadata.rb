name             'vault'
maintainer       'William Huba'
maintainer_email 'hexedpackets@gmail.com'
license          'MIT'
description      'Installs/Configures Vault'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.2.0'

supports 'ubuntu'
supports 'debian'

source_url 'https://github.com/hexedpackets/chef-vault' if respond_to?(:source_url)
issues_url 'https://github.com/hexedpackets/chef-vault/issues' if respond_to?(:issues_url)
