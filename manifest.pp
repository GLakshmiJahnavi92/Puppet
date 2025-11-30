# manifest.pp - Puppet manifest for Bolt on Windows

# Include chocolatey class (module must be installed in modulepath)
include chocolatey

# Ensure directory exists
file { 'C:/Jahnavi/Puppet-demo/mydir':
  ensure => directory,
}

# Create hello.txt with content
file { 'C:/Jahnavi/Puppet-demo/hello.txt':
  ensure  => file,
  content => "Hello Puppet!\n",
  require => File['C:/Jahnavi/Puppet-demo/mydir'],
}

# Install Apache HTTP Server via Chocolatey
package { 'apache-httpd':
  ensure   => installed,
  provider => chocolatey,
  require  => Class['chocolatey'],
}