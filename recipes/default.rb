#
# Cookbook Name:: co-cloudmonkey
# Recipe:: default
#
# Author:: Pierre-Luc Dion (<pdion@cloudops.com>)
# Copyright:: Copyright (c) 2015 CloudOps.com
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#
# install cloudmonkey  python-pip package and configure root user.

# install python
include_recipe "python"

# install latest cloudmonkey 
python_pip "cloudmonkey"

api_key = ""
secret_key = ""

begin
  host_url = search(:node, "chef_environment:#{node.chef_environment} AND cloudstack_url:* ").first
rescue
  host_url = 'http://localhost:8080/client/api'
  return
end

#  uri_host = URI.parse(host_url["cloudstack"]["cloudstack_url"]).host
apikey = search(:node, "chef_environment:#{node.chef_environment} AND api_key:* AND secret_key:*").first
unless apikey.empty?
  api_key = apikey["cloudstack"]["admin"]["api_key"]
  secret_key = apikey["cloudstack"]["admin"]["secret_key"]
end

directory "/root/.cloudmonkey" do
  owner 'root'
  group 'root'
  action :create
end

template "/root/.cloudmonkey/config" do
  source "config.erb"
  owner "root"
  group "root"
  mode "0600"
  variables(
    :uri_host   => 'http://localhost:8080/client/api',
    :api_key    => api_key,
    :secret_key => secret_key
  )
end

 