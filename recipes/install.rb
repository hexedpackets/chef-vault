# Install the unzip package
package 'unzip' do
  action :install
end

zip_file = File.join(Chef::Config[:file_cache_path], node[:vault][:zip_file])
remote_file zip_file do
  source node[:vault][:download_url]
  notifies :run, 'execute[install vault]', :immediately
end

execute 'install vault' do
  cwd Chef::Config[:file_cache_path]
  command "unzip -o #{zip_file} -d #{node[:vault][:bin_dir]}"
  action :nothing
end
