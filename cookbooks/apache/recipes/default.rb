#
# Cookbook Name:: apache
# Recipe:: default
#
# Copyright 2017, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#


case node[:platform_family]
	when "debian"
		package 'apache2'
		service 'apache2' do
			action [:enable, :start]
		end

	when "rhel"
		package 'httpd'
		service 'httpd' do
			action [:enable, :start]
		end
end