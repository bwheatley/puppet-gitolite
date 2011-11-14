class git::server(
  $site_name = '',
  $ssh_key,
  $vhost     = '',
  $apache_conf = ''
) {
  include git::params
  
  if $site_name == '' { $REAL_site_name = $git::params::gt_site_name } 
  else { $REAL_site_name = $site_name }
  
  if $vhost == '' { $REAL_vhost = $git::params::gt_vhost } 
  else { $REAL_vhost = $vhost }

  git::anchor { 'git::server::begin': }
  -> class { 'git::server::package': }
  -> class { 'git::server::config': 
    site_name => $REAL_site_name,
    ssh_key   => $ssh_key,
    vhost     => $REAL_vhost,
    apache_conf => $apache_conf,
  }
  -> git::anchor { 'git::server::end': }
}
