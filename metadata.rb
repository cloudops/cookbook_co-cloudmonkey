name             'co-cloudmonkey'
maintainer       'CloudOps.com'
maintainer_email 'pdion@cloudops.com'
license          'Apache 2.0'
description      'Installs/Configures co-cloudmonkey'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.3.1'

depends           'python'

recipe "co-cloudmonkey", "Installs cloudmonkey using Pyhton-pip"

%w{ debian ubuntu centos redhat fedora freebsd smartos }.each do |os|
  supports os
end
