#
# Cookbook:: apache
# Recipe:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.
if node[platform_family] == "rhel"
	mypackage = "httpd"
elsif node[platform_family] == "debian"
	mypackage = "apache2"
end
package 'apache2' do
	package_name mypackage
	action :install
end
service 'apache2' do
	service_name 'httpd'
	action [:enable, :start]
end
#include_recipe 'apache::websites'
