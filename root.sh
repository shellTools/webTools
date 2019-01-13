#!/bin/bash
# ./root.sh

# Backup and delete the old Kerberos config file
cp /etc/krb5.conf /etc/krb5.conf.bak
rm /etc/krb5.conf

# Kerberos setup: to access to 42's kerberos server
cat >> /etc/krb5.conf << EOF
[libdefaults]
	default_realm = 42.US.ORG
	forwardable = true
	proxiable = true
   	dns_lookup_kdc = no
   	dns_lookup_realm = no
	allow_weak_crypto = true
[realms]
	42.US.ORG = {
            kdc = kdc1.42.US.ORG
            admin_server = kdc1.42.US.ORG
            default_domain = 42.US.ORG
            default_lifetime = 7d
            ticket_lifetime = 7d
	}
[domain_realm]
	.42.US.ORG = 42.US.ORG
	42.US.ORG = 42.US.ORG
EOF

# Ssh setup: to access to 42's git server (vogsphere)
cat >> /etc/ssh/ssh_config << EOF
Host *.42.US.ORG
     SendEnv LANG LC_*
     StrictHostKeyChecking no
     GSSAPIAuthentication yes
     GSSAPIDelegateCredentials yes
     PasswordAuthentication yes
EOF
