---
x-trestle-global:
  profile:
    title: OCP4 CIS Profile
---

# CIS-4.2.4 - \[Kubelet\] Verify that the read only port is not used or is set to 0

## Control Statement

Disable the read-only port.

## Control rationale_statement

The Kubelet process provides a read-only API in addition to the main Kubelet API. Unauthenticated access is provided to this read-only API which could possibly retrieve potentially sensitive information about the cluster.

## Control impact_statement

Removal of the read-only port will require that any service which made use of it will need to be re-configured to use the main Kubelet API.

## Control remediation_procedure

In earlier versions of OpenShift 4, the `read-only-port` argument is not used. 

Follow the instructions in the documentation to create a Kubelet config CRD and set the `--read-only-port` is set to `0`.

## Control audit_procedure

In OpenShift 4, the kubelet is managed by the Machine Config Operator. The kubelet config file is found at `/etc/kubernetes/kubelet.conf`. OpenShift disables the read-only port (10255) on all nodes by setting the `read-only-port` kubelet flag to 0 by default in OpenShift 4.6 and above. In OpenShift 4.5 and earlier, the `read-only-port` argument is not used. 

Run the following command:

```

oc -n openshift-kube-apiserver get cm kube-apiserver-pod -o yaml | grep --color read-only-port

oc -n openshift-kube-apiserver get cm config -o yaml | grep --color "read-only-port”
```

For OpenShift 4.5, verify that nothing is returned. Configuration information is available here: https://github.com/openshift/kubernetes-kubelet/blob/origin-4.5-kubernetes-1.18.3/config/v1beta1/types.go#L135-L141

For OpenShift 4.6, verify that the `read-only-port` is set to `0`.

## Control CIS_Controls

TITLE:Uninstall or Disable Unnecessary Services on Enterprise Assets and Software CONTROL:v8 4.8 DESCRIPTION:Uninstall or disable unnecessary services on enterprise assets and software, such as an unused file sharing service, web application module, or service function.;TITLE:Ensure Only Approved Ports, Protocols and Services Are Running CONTROL:v7 9.2 DESCRIPTION:Ensure that only network ports, protocols, and services listening on a system with validated business needs, are running on each system.;

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
