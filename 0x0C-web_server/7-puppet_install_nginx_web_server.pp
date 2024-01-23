# Using Puppet, install and configure an nginx web server.
# Include resources in the manifest to perform a 301 redirect when querying /redirect_me
# Requierments:
#	nginx should be listening to port 80
# 	when querying / it must return a page with the content "Hello World!"
#   the redirection must be permanent

# Update the package manager
exec { 'apt-get update':
	command => '/usr/bin/apt-get update',
}

# Install nginx
package { 'nginx':
	ensure => 'installed',
	require => Exec['apt-get update'],
}

# Configure nginx
file { '/etc/nginx/sites-available/default':
	ensure => 'file',
	content => 'server {
		listen 80 default_server;
		listen [::]:80 default_server ipv6only=on;

		root /usr/share/nginx/html;
		index index.html index.htm;

		server_name localhost;

		location / {
			try_files $uri $uri/ =404;
		}

		location /redirect_me {
			return 301 http://www.google.com/;
		}
	}',
	require => Package['nginx'],
}

# Create and populate the index.html file
file { '/usr/share/nginx/html/index.html':
	ensure => 'file',
	content => 'Hello World!',
	require => Package['nginx'],
}

# Restart nginx
service { 'nginx':
	ensure => 'running',
	require => Package['nginx'],
	require => File['/usr/share/nginx/html/index.html'],
}
