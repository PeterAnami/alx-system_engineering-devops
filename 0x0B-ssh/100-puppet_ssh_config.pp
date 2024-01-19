# User Puppet to make changes to our client-side ssh config file
# to allow us to connect to the server without
# having to type in a password.
# use the private key ~/.ssh/school

$ssh_dir = '/home/akuya/example/.ssh'
$config_content = 'Host *\n\tIdentityFile ~/.ssh/school\n\tPasswordAuthentication no'

file { $ssh_dir:
  ensure => directory,
  mode   => '0600',
  owner  => 'akuya',
  group  => 'akuya',
}

file { "${ssh_dir}/config":
  ensure  => present,
  mode    => '0600',
  owner   => 'akuya',
  group   => 'akuya',
  content => $config_content,
  require => File[$ssh_dir],
}
