class git(
  $server    = 'false',
  $site_name = '',
  $vhost     = ''
) {
  include git::params

  define anchor () {
    # nothing but a class to bind to
  }

  git::anchor { 'git::begin': }
  -> class  { 'git::client': }
  -> git::anchor { 'git::end': }

  if $server == 'true' {
    class { 'git::server':
      site_name => $site_name,
      vhost     => $vhost,
      require   => Class['git::client'], 
      before    => Anchor['git::end'],
    }
  }
}
