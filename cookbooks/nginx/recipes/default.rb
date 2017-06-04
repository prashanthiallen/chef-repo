#
# Cookbook Name:: nginx
# Recipe:: default
#
# Copyright 2017, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#



packages = ['epel-release', 'nginx']


packages.each do |pkg|
	package pkg
end

service 'nginx' do
	action :start
end
