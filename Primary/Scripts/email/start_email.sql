--Desde sys
GRANT EXECUTE ON UTL_SMTP    TO VITALIS_SCHEMA;
GRANT EXECUTE ON UTL_TCP     TO VITALIS_SCHEMA;

-- Script para testear conexión SMTP con Brevo
BEGIN
  DBMS_NETWORK_ACL_ADMIN.APPEND_HOST_ACE(
    host        => 'smtp-relay.brevo.com',
    lower_port  => 587,
    upper_port  => 587,
    ace         => xs$ace_type(
                     privilege_list => xs$name_list('connect'),
                     principal_name => 'VITALIS_SCHEMA',      
                     principal_type => xs_acl.ptype_db
                   )
  );
END;
/


-- Probar conexión
SELECT host, lower_port, upper_port FROM dba_network_acls;
SELECT acl, principal, privilege FROM dba_network_acl_privileges
WHERE principal = 'VITALIS_SCHEMA';
