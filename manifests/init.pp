# Initial setup
  class audit {
    file {"audit":
        ensure => present,
        path   => "/var/log/audit.log",
        mode   => "0555",
    }

     concat{"/etc/profile.d/audit.sh":
        require => File["audit"],
     }
  
  # use this to set values
     concat::fragment{"profile":
        target => "/etc/profile.d/audit.sh",
        source => "puppet:///modules/audit/audit.sh",
  }
    file { '/etc/logrotate.d/audituser':
        ensure => 'file',
        owner => 'root',
        group => 'root',
        mode => '0644',
        source => 'puppet:///modules/audit/logrotate',
  }
}
