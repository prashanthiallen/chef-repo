#
# Cookbook Name:: rails
# Recipe:: default
#
# Copyright 2017, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

package 'ruby' do 
	version '2.3.1'
	action :install
end

package 'nodejs'