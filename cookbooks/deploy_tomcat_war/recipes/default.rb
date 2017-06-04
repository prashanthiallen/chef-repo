#
# Cookbook Name:: deploy_tomcat_war
# Recipe:: default
#
# Copyright 2017, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

=begin
https://www.digitalocean.com/community/tutorials/how-to-install-apache-tomcat-8-on-ubuntu-14-04

shopintuit ALL=(ALL) NOPASSWD: ALL
/etc/sudoers.d/shopintuit


file
cookbook_file
remote_file
template
  sudoer.erb
    <%= node['deploy_tomcat_war']['user'] %> ALL=(ALL) NOPASSWD: ALL

create a group called dynamo
1. create user called shopintuit
  group dynamo
  home directory should be defined
  no password
  shell /bin/bash

2. install oracle java
3. set JAVA_HOME env variable
create a directory
4. download tomcat tar file in to tabove directory
5. extract tomcat.tar
6. start tomcat service

1. create directory called
=end

group 'dynamo'

user node['deploy_tomcat_war']['user'] do
  home "/home/#{node['deploy_tomcat_war']['user']}"
  manage_home true
  shell '/bin/bash'
  gid 'dynamo'
end

template "/etc/sudoers.d/#{node['deploy_tomcat_war']['user']}" do
  source 'sudoers.erb'
  owner 'root'
  group 'root'
  mode '0400'
end
