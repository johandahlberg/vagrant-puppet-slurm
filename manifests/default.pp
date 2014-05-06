exec { "apt-get update":
  path => "/usr/bin",
}

package { "slurm-llnl":
  ensure  => present,
  require => Exec["apt-get update"]
}

file { '/etc/slurm-llnl/slurm.conf':
        ensure  => 'file',
        source  => '/vagrant/slurm.conf',
        require => Package["slurm-llnl"]
}

package { "munge":
	ensure => installed }

file { '/etc/munge':
	ensure => 'directory',
	group  => 'munge',
	mode   => '700',
	owner  => 'munge',
	require => Package["munge"]
}

file { '/etc/munge/munge.key':
	ensure  => 'file',
	group   => 'munge',
	mode    => '400',
	owner   => 'munge',
	source  => '/vagrant/modules/munge/munge.key',
	require => Package["munge"]
}


service { "munge":
	ensure => "running",
	require => File["/etc/munge/munge.key"] }

File["/etc/munge"] -> File["/etc/munge/munge.key"]
