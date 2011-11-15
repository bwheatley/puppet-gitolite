class git::server(
  $site_name = '',
  $ssh_key,
  $vhost     = 'git',
  $apache_conf = '',
  $gitolite_rc = ''
) {
  include git::params
  
  if $site_name == '' { $REAL_site_name = $git::params::gt_site_name } 
  else { $REAL_site_name = $site_name }
  
  git::anchor { 'git::server::begin': }
  -> class { 'git::server::package': }
  -> class { 'git::server::config': 
    site_name => $REAL_site_name,
    ssh_key   => $ssh_key,
    vhost     => $vhost,
    apache_conf => $apache_conf,
    gitolite_rc => $gitolite_rc,
  }
  -> git::anchor { 'git::server::end': }
}
