---
x-trestle-global:
  profile:
    title: OCP4 CIS Profile
---

# CIS-1.3.7 - \[Controller Manager\] Ensure that the --bind-address argument is set to 127.0.0.1

## Control Statement

Do not bind the Controller Manager service to non-loopback insecure addresses.

## Control rationale_statement

The Controller Manager API service which runs on port 10257/TCP by default is used for health and metrics information and is available without authentication or encryption. As such it should only be bound to a localhost interface, to minimize the cluster's attack surface

## Control impact_statement

None

## Control remediation_procedure

None required. The OpenShift operators configure this correctly.

## Control audit_procedure

The `bind-address` argument is not used. The `secure-port` argument is set to `10257`. The `insecure-port` argument is set to `0`. 

Run the following command:

```
oc get configmaps config -n openshift-kube-controller-manager -ojson | jq -r '.data["config.yaml"]' | jq '.extendedArguments["secure-port"][]'

oc get configmaps config -n openshift-kube-controller-manager -ojson | jq -r '.data["config.yaml"]' | jq '.extendedArguments["port"][]'

#Following should fail with a http code 403
POD=$(oc get pods -n openshift-kube-controller-manager -l app=kube-controller-manager -o jsonpath='{.items[0].metadata.name}')

oc rsh -n openshift-kube-controller-manager -c kube-controller-manager $POD curl https://localhost:10257/metrics -k
```

Verify that `secure-port` is set to `10257` and that `port` is set to `0`.

Verify that attempt to access the controller manager metrics fails with a HTTP code 403.

## Control CIS_Controls

TITLE:Use of Secure Network Management and Communication Protocols  CONTROL:v8 12.6 DESCRIPTION:Use secure network management and communication protocols (e.g., 802.1X, Wi-Fi Protected Access 2 (WPA2) Enterprise or greater).;TITLE:Ensure Only Approved Ports, Protocols and Services Are Running CONTROL:v7 9.2 DESCRIPTION:Ensure that only network ports, protocols, and services listening on a system with validated business needs, are running on each system.;

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
