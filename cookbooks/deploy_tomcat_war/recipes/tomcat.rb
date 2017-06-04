=begin

install java from debain file
install tomcat from tar file
deploy war file
start tomcat service

remote_file "/home/#{node['deploy_tomcat_war']['user']}/jre-8u131-linux-i586.tar.gz" do
  source 'https://s3.amazonaws.com/thecamion-paperclip-dev/jre-8u131-linux-i586.tar.gz'
  owner node['deploy_tomcat_war']['user']
  group node['deploy_tomcat_war']['group']
  mode '0755'
  action :create
end

# remote_file '/tmp/zonemig.zip' do
#   source 'https://s3.amazonaws.com/thecamion-paperclip-dev/jre-8u131-linux-i586.tar.gz'
# end

#cd ~
#tar -xzf *.tar.gz /opt/

execute 'java-extract' do
  command "tar -xzf /home/#{node['deploy_tomcat_war']['user']}/jre-8u131-linux-i586.tar.gz"
  cwd '/opt'
end

=end

package 'java'
remote_file "/home/#{node['deploy_tomcat_war']['user']}/apache-tomcat-8.5.15.tar.gz" do
  source 'http://mirror.fibergrid.in/apache/tomcat/tomcat-8/v8.5.15/bin/apache-tomcat-8.5.15.tar.gz'
  owner node['deploy_tomcat_war']['user']
  group node['deploy_tomcat_war']['group']
  mode '0755'
  action :create
end

execute 'tomcat-extract' do
  command "tar -xzf /home/#{node['deploy_tomcat_war']['user']}/apache-tomcat-8.5.15.tar.gz"
  cwd '/opt'
end

service "tomcat" do
  action [:enable,:start]
  start_command "/opt/apache-tomcat-8.5.15/bin/startup.sh"
  #status_command
  stop_command "/opt/apache-tomcat-8.5.15/bin/shutdown.sh"
end

remote_file "/opt/apache-tomcat-8.5.15/webapps/sample.war" do
  source 'https://tomcat.apache.org/tomcat-7.0-doc/appdev/sample/sample.war'
  mode '0755'
  action :create
end
