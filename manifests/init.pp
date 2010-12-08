#
# nfs module
#
# Copyright 2010, Atizo AG
# Simon Josi simon.josi+puppet(at)atizo.com
#
# This program is free software; you can redistribute 
# it and/or modify it under the terms of the GNU 
# General Public License version 3 as published by 
# the Free Software Foundation.
#
# This module manages an nfs client
# to manage the nfs server please look
# into the module nfsd
#

class nfs {
  package{'nfs-utils':
    ensure => installed,
  }
  service{[ 'portmap', 'nfs', 'nfslock' ]:
    ensure => running,
    enable => true,
    hasstatus => true,
    require => Package['nfs-utils'],
  }
  service{[ 'rpcgssd', 'rpcidmapd', 'rpcsvcgssd' ]:
    ensure => stopped,
    enable => false,
    hasstatus => true,
    require => Package['nfs-utils'],
  }
}
