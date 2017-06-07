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
