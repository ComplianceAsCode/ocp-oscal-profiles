---
x-trestle-global:
  profile:
    title: OCP4 CIS Profile
---

# CIS-1.2.7 - \[API Server\] Ensure that the --authorization-mode argument is not set to AlwaysAllow

## Control Statement

Do not always authorize all requests.

## Control rationale_statement

The API Server, can be configured to allow all requests. This mode should not be used on any production cluster.

## Control impact_statement

Only authorized requests will be served.

## Control remediation_procedure

None. RBAC is always on and the OpenShift API server does not use the values assigned to the flag authorization-mode.

## Control audit_procedure

It is not possible to configure an OpenShift cluster to allow all requests. OpenShift is configured at bootstrap time to use RBAC to authorize requests. Role-based access control (RBAC) objects determine what actions a user is allowed to perform on what objects in an OpenShift cluster. Cluster administrators manage RBAC for the cluster. Project owners can manage RBAC for their individual OpenShift projects. The OpenShift API server configmap does not use the `authorization-mode` flag. 

To verify, run the following commands:

```
# To verify that the authorization-mode argument is not used 
oc get configmap config -n openshift-kube-apiserver -ojson | jq -r '.data["config.yaml"]' | jq '.apiServerArguments' 
oc get configmap config -n openshift-apiserver -ojson | jq -r '.data["config.yaml"]' | jq '.apiServerArguments' 

#Check that no overrides are configured
oc get kubeapiservers.operator.openshift.io cluster -o json | jq -r '.spec.unsupportedConfigOverrides'

# To verify RBAC is configured:
oc get clusterrolebinding
oc get clusterrole
oc get rolebinding
oc get role
```

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
