#
# Cookbook Name:: apache
# Recipe:: default
#
# Copyright (c) 2014 The Authors, All Rights Reserved.

package 'httpd'

template '/var/www/html/index.html' do
  source 'index.html.erb'
  mode "0644"
  # TODO how to specify user/group across real machines + kitchen?
  # owner "chef"
  # group "chef"
end

service 'httpd' do
  action [:start, :enable]
end
