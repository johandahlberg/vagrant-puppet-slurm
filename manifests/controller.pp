#file{'/var/spool/slurmctld':
#	ensure  => 'directory',
#	owner   => 'slurm',
#    	group   => 'slurm',
#    	mode    => '0750',
#}
#
service { "slurmctld":
	   name       => "slurmctld",
           ensure     => "running",
           binary     => "/usr/sbin/slurmctld",
           enable     => true,
	   provider   => "base",
}

