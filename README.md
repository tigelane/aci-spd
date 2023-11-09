# aci-spd
Single Page Demo components for Cisco ACI using the sandbox


From:  http://networkbit.ch/cisco-aci-automation-curl/

## Returns values
Good return from add or remove tenant:
* {"totalCount":"0","imdata":[]}

Good return from get_tenants.sh:
* ["infra","common","mgmt","New_Tenant_1234","oneaciapp","csv","cvs2","demo_tenant_tt","tn_MyTenant","TEST_EP","tn_MyTenant2","terraform_tenant","dm_cli_terraform_T01","TNT_LAB_ENVC","TNT_LAB-ENVB","TEST123","new_tenant"]

## Proposed usage
* Use `get_tenants.sh` to populate a table of tenants
* Use the `add_tenant.sh` from a button to execute a change
* Use `get_tenants.sh` to pupulate a new table of tenants, now showing the new tenant
* Use the `remove_tenant.sh` from a button to execute another change
* Use `get_tenants.sh` to populate a new table of tenants showing that the new one was removed