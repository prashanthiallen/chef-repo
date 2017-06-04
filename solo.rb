chef_home_dir             File.expand_path('.')
log_level                 :info
log_location              STDOUT
cookbook_path             File.join(chef_home_dir, 'cookbooks')
file_cache_path           File.join(chef_home_dir, 'cache')
file_backup_path          File.join(chef_home_dir, 'backup')
data_bag_path             File.join(chef_home_dir, 'data_bags')
environment_path          File.join(chef_home_dir, 'environments')
role_path                 File.join(chef_home_dir, 'roles')
