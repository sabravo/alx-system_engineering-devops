#manifest that setup a custom HTTP header for web server

package {'nginx':
  ensure   => 'installed',
  provider => 'apt',
}

exec {'allow http':
  command => '/usr/sbin/ufw allow "Nginx HTTP"'
}

file {'/var/www/html/index.html':
  ensure  => file,
  content => 'Hello World!'
}

file {'/var/www/html/404.html':
  ensure  => file,
  content => "Ceci n'est pas une page"
}

file_line {'redirect':
  ensure => 'present',
  path   => '/etc/nginx/sites-available/default',
  after  => 'root /var/www/html',
  line   => 'rewrite ^/redirect_me https://www.digitalocean.com/community permanent;',
}

file {'/etc/nginx/sites-enabled/default':
  ensure  => file,
  content => "add_header X-Served-By ${facts['facts['networking']['hostname']']}"
}

exec {'nginx restart':
  command  => 'service nginx restart',
  provider => 'shell',
  require  => Package['nginx']
}
#manifest that setup a custom HTTP header for web server

package {'nginx':
  ensure   => 'installed',
  provider => 'apt',
}

exec {'allow http':
  command => '/usr/sbin/ufw allow "Nginx HTTP"'
}

file {'/var/www/html/index.html':
  ensure  => file,
  content => 'Hello World!'
}

file {'/var/www/html/404.html':
  ensure  => file,
  content => "Ceci n'est pas une page"
}

file_line {'redirect':
  ensure => 'present',
  path   => '/etc/nginx/sites-available/default',
  after  => 'root /var/www/html',
  line   => 'rewrite ^/redirect_me https://www.digitalocean.com/community permanent;',
}

file {'/etc/nginx/sites-enabled/default':
  ensure  => file,
  content => "add_header X-Served-By ${facts['facts['networking']['hostname']']}"
}

exec {'nginx restart':
  command  => 'service nginx restart',
  provider => 'shell',
  require  => Package['nginx']
}

