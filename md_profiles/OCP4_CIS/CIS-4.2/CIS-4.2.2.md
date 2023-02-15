---
x-trestle-global:
  profile:
    title: OCP4 CIS Profile
---

# CIS-4.2.2 - \[Kubelet\] Ensure that the --authorization-mode argument is not set to AlwaysAllow

## Control Statement

Do not allow all requests. Enable explicit authorization.

## Control rationale_statement

Kubelets, by default, allow all authenticated requests (even anonymous ones) without needing explicit authorization checks from the apiserver. You should restrict this behavior and only allow explicitly authorized requests.

## Control impact_statement

Unauthorized requests will be denied.

## Control remediation_procedure

None required. Unauthenticated/Unauthorized users have no access to OpenShift nodes.

## Control audit_procedure

In OpenShift 4, the kublet config file is managed by the Machine Config Operator. By default, Unauthenticated/Unauthorized users have no access to OpenShift nodes. Run the following command:

```

#In one terminal, run:
 oc proxy

#Then in another terminal, run:
for name in $(oc get nodes -ojsonpath='{.items[*].metadata.name}')
do 
 curl -sS http://127.0.0.1:8080/api/v1/nodes/$name/proxy/configz | jq -r '.kubeletconfig.authorization.mode'
 done

# Alternative without oc proxy
POD=$(oc -n openshift-kube-apiserver get pod -l app=openshift-kube-apiserver -o jsonpath='{.items[0].metadata.name}')

TOKEN=$(oc whoami -t)

for name in $(oc get nodes -ojsonpath='{.items[*].metadata.name}')
do
 oc exec -n openshift-kube-apiserver $POD -- curl -sS https://172.25.0.1/api/v1/nodes/$name/proxy/configz -k -H "Authorization: Bearer $TOKEN" | jq -r '.kubeletconfig.authorization.mode'
done
```

Verify that access is not successful.

## Control CIS_Controls

TITLE:Configure Data Access Control Lists CONTROL:v8 3.3 DESCRIPTION:Configure data access control lists based on a user’s need to know. Apply data access control lists, also known as access permissions, to local and remote file systems, databases, and applications.;TITLE:Ensure Only Approved Ports, Protocols and Services Are Running CONTROL:v7 9.2 DESCRIPTION:Ensure that only network ports, protocols, and services listening on a system with validated business needs, are running on each system.;

# Editable Content

<!-- Make additions and edits below -->
<!-- The above represents the contents of the control as received by the profile, prior to additions. -->
<!-- If the profile makes additions to the control, they will appear below. -->
<!-- The above markdown may not be edited but you may edit the content below, and/or introduce new additions to be made by the profile. -->
<!-- If there is a yaml header at the top, parameter values may be edited. Use --set-parameters to incorporate the changes during assembly. -->
<!-- The content here will then replace what is in the profile for this control, after running profile-assemble. -->
<!-- The current profile has no added parts for this control, but you may add new ones here. -->
<!-- Each addition must have a heading either of the form ## Control my_addition_name -->
<!-- or ## Part a. (where the a. refers to one of the control statement labels.) -->
<!-- "## Control" parts are new parts added after the statement part. -->
<!-- "## Part" parts are new parts added into the top-level statement part with that label. -->
<!-- Subparts may be added with nested hash levels of the form ### My Subpart Name -->
<!-- underneath the parent ## Control or ## Part being added -->
<!-- See https://ibm.github.io/compliance-trestle/tutorials/ssp_profile_catalog_authoring/ssp_profile_catalog_authoring for guidance. -->
