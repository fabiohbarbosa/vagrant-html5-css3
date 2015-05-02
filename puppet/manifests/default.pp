Exec { path => [ '/bin/', '/sbin/' , '/usr/bin/', '/usr/sbin/' ] }

# Node
class { 'nodejs':
  version => 'stable',
  with_npm => false,
}

# Install node modules to server
class node_modules {
  $node_packages = [  'npm', 'gulp', 'bower'  ]

  package { $node_packages:
    provider => 'npm',
    require  => Class['nodejs']
  }
}

# Include modules
include system-update

include stdlib
include wget
include nodejs
include node_modules
