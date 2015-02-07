co-cloudmonkey Cookbook
=======================

This cookbook will install cloudmonkey and create configuration file for user root.
If use with cloudstack cookbook, it will add admin account <tt>api_key</tt> and <tt>secret_key</tt> in the config located in <tt>/root/.cloudmonkey/config</tt>.

The Apache CloudStack CloudMonkey is a command line interface (CLI) tool for [CloudStack](http://cloudstack.apache.org/) written in Python. cloudmonkey can be use both as an interactive shell and as a command line tool which simplifies CS configuration and management.

Requirements
------------
- 'python::pip'


Attributes
----------

Attributes not required in order to install cloudmonkey.

- <tt>node['cloudstack']['admin']['api_key']</tt> - Cloudstack admin account <tt>api_key</tt>. Empty if not populated by co-cloudstack cookbook.
- <tt>node['cloudstack']['admin']['secret_key']</tt> - Cloudstack admin account <tt>secret_key</tt>. Empty if not populated by co-cloudstack cookbook.


License and Authors
-------------------
- Authors:: Pierre-Luc Dion (<pdion@cloudops.com>)

```text
Copyright:: Copyright (c) 2015 CloudOps.com

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
```