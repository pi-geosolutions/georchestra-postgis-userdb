#!/bin/bash

#configure postgresql access (pg_hba.conf file) touse LDAP
# if [ -n $LDAP_SERVER ]; then
#     #drop last line
#     #sed -i '$ d' $PGDATA/pg_hba.conf
#
#     # Disallow anyone to connect except locally from this container...
#     sed -i "s|host all all all trust||g" $PGDATA/pg_hba.conf
#     sed -i "s|host all all all md5||g" $PGDATA/pg_hba.conf
#
#     # ...except for georchestra user (DB owner) to connect if on local rancher subnetwork (10.42.*.*)
#     # Other users need to authenticate through LDAP
#     echo "host    all             georchestra     10.42.0.0/16            md5" >> $PGDATA/pg_hba.conf
#
#     #and replace it by
#     echo "# configuring LDAP auth"
#     # The filter (memberof...) does not work. A shame. Anyway, it does no harm either...
#     #Seems that filter is not allowed in ldapurl
#     #echo "host all all all ldap ldapurl=\"ldap://${LDAP_SERVER}/dc=${LDAP_DC1},dc=${LDAP_DC2}?uid?sub?(memberof=cn=PGSQL,ou=roles,dc=${LDAP_DC1},dc=${LDAP_DC2})\"" >> "$PGDATA/pg_hba.conf"
#     #echo "host all all all ldap ldapserver=${LDAP_SERVER} ldapbasedn=\"dc=${LDAP_DC1},dc=${LDAP_DC2}\" ldapsearchattribute=uid" >> "$PGDATA/pg_hba.conf"
#     echo "#host all all all ldap ldapurl=\"ldap://ldap.georchestra/dc=georchestra,dc=org?uid?sub\"" >> $PGDATA/pg_hba.conf
#     echo "host all all all ldap ldapurl=\"ldap://${LDAP_SERVER}/dc=${LDAP_DC1},dc=${LDAP_DC2}?uid?sub\"" >> $PGDATA/pg_hba.conf
#
#     #echo "reloading pg_ctl after pg_hba modifs"
#     #pg_ctl restart -D "$PGDATA" -m fast -w
# fi

envsubst < "/var/lib/postgresl/data/pg_hba.conf.tpl" > $PGDATA/pg_hba.conf
ls -la $PGDATA/
cat $PGDATA/pg_hba.conf
