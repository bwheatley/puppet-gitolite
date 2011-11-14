class git::client::package {
  include git::params

  @package { $git::params::gt_client_package:
    ensure => 'present',
    tag    => 'git-client-package',
  }
  Package<| tag == 'git-client-package' |>
}
