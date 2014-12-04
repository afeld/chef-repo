#
# Cookbook Name:: ntp
# Recipe:: default
#
# Copyright (c) 2014 The Authors, All Rights Reserved.

package "ntp"

package "ntpdate"

template "/etc/ntp.conf" do
  source "ntp.conf.erb"
  mode "0644"
  owner "root"
  group "root"
end

service "ntpd" do
  action [:start, :enable]
  subscribes :reload, "template[/etc/ntp.conf]", :immediately
end
