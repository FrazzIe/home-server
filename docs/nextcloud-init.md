```
docker exec -it nextcloud bash

occ app:install user_ldap
occ app:enable user_ldap
occ ldap:create-empty-config

# configure below
occ ldap:set-config s01 ldapBase "dc=example,dc=com"
occ ldap:set-config s01 ldapBaseUsers "dc=example,dc=com"
occ ldap:set-config s01 ldapBaseGroups "dc=example,dc=com"
occ ldap:set-config s01 ldapAgentName "uid=ro_admin,ou=people,dc=example,dc=com"
occ ldap:set-config s01 ldapAgentPassword "password"
occ ldap:set-config s01 ldapGroupFilter "(&(objectclass=groupOfUniqueNames)(|(cn=nextcloud_user)(cn=nextcloud_admin)(cn=nextcloud_friend)(cn=nextcloud_family)))"
occ ldap:set-config s01 ldapGroupFilterGroups "user;admin;friend;family"
occ ldap:set-config s01 ldapUserFilter "(&(objectclass=person)(memberOf=cn=nextcloud_user,ou=groups,dc=example,dc=com))"
occ ldap:set-config s01 ldapLoginFilter "(&(&(objectclass=person)(memberOf=cn=nextcloud_user,ou=groups,dc=example,dc=com))(uid=%uid))"
occ ldap:set-config s01 ldapHost "ldap://lldap"
occ ldap:set-config s01 ldapPort 3890

# leave as is
occ ldap:set-config s01 ldapConfigurationActive 1
occ ldap:set-config s01 ldapUserFilterMode 0
occ ldap:set-config s01 ldapUserFilterObjectclass person
occ ldap:set-config s01 turnOnPasswordChange 0
occ ldap:set-config s01 ldapCacheTTL 600
occ ldap:set-config s01 ldapExperiencedAdmin 0
occ ldap:set-config s01 ldapGidNumber gidNumber
occ ldap:set-config s01 ldapGroupFilterMode 0
occ ldap:set-config s01 ldapGroupDisplayName cn
occ ldap:set-config s01 ldapGroupFilterObjectclass groupOfUniqueNames
occ ldap:set-config s01 ldapGroupMemberAssocAttr uniqueMember
occ ldap:set-config s01 ldapEmailAttribute "mail" 
occ ldap:set-config s01 ldapLoginFilterEmail 0
occ ldap:set-config s01 ldapLoginFilterUsername 1
occ ldap:set-config s01 ldapMatchingRuleInChainState unknown
occ ldap:set-config s01 ldapNestedGroups 0
occ ldap:set-config s01 ldapPagingSize 500
occ ldap:set-config s01 ldapTLS 0
occ ldap:set-config s01 ldapUserAvatarRule default
occ ldap:set-config s01 ldapUserDisplayName displayname
occ ldap:set-config s01 ldapUserFilterMode 1
occ ldap:set-config s01 ldapUuidGroupAttribute auto
occ ldap:set-config s01 ldapUuidUserAttribute auto
occ ldap:set-config s01 ldapExpertUsernameAttr user_id

php occ config:system:set enabledPreviewProviders 0 --value="OC\\Preview\\Imaginary"
php occ config:system:set enabledPreviewProviders 1 --value="OC\\Preview\\OpenDocument"
php occ config:system:set enabledPreviewProviders 2 --value="OC\\Preview\\ImaginaryPDF"
php occ config:system:set enabledPreviewProviders 3 --value="OC\\Preview\\MSOfficeDoc"
php occ config:system:set enabledPreviewProviders 4 --value="OC\\Preview\\MarkDown"
php occ config:system:set enabledPreviewProviders 5 --value="OC\\Preview\\MP3"
php occ config:system:set enabledPreviewProviders 6 --value="OC\\Preview\\MP4"
php occ config:system:set enabledPreviewProviders 7 --value="OC\\Preview\\AVI"
php occ config:system:set enabledPreviewProviders 8 --value="OC\\Preview\\Movie"
php occ config:system:set enabledPreviewProviders 9 --value="OC\\Preview\\MKV"
php occ config:system:set enabledPreviewProviders 10 --value="OC\\Preview\\XCF"
```