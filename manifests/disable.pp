class nfs::disable inherits nfs {
  Service['portmap']{
    ensure => stopped,
    enable => false,
  }
  Service['nfs']{
    ensure => stopped,
    enable => false,
  }
  Service['nfslock']{
    ensure => stopped,
    enable => false,
  }
}
