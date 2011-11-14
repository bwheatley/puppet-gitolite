class git::client {
  git::anchor { 'git::client::begin': }
  -> class { 'git::client::package': }
  -> git::anchor { 'git::client::end': }
}
