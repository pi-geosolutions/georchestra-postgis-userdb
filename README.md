In case you have to build the `pigeosolutions/georchestra-postgis-userdb` docker image, this can be done inside this directory with:
```
docker build -t pigeosolutions/georchestra-postgis-userdb .
```

## Configure OpenLDAP auth
Set the following variables :
 * LDAP_SERVER: the LDAP server hostname
 * LDAP_BASEDN: the base DN of the LDAP entry (e.g. "dc=mydomain,dc=org")

 Beware that it will only manage authentication, but won't create the users. You need to manually create the users (same name as in LDAP) in postgreSQL and give them access rights.


## Available extensions
This image is built to support following extensions:
* postgis
* PL/python (plpythonu): extension is available, but not installed.
