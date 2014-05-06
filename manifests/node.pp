service { "slurm-llnl":
           ensure     => "running",
           hasstatus  => true,
           hasrestart => true,
           enable     => true,
}
