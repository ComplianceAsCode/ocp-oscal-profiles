---
x-trestle-global:
  profile:
    title: OCP4 CIS Profile
---

# CIS-1.2.18 - \[API Server\] Ensure that the --insecure-bind-address argument is not set

## Control Statement

Do not bind the insecure API service.

## Control rationale_statement

If you bind the `apiserver` to an insecure address, basically anyone who could connect to it over the insecure port, would have unauthenticated and unencrypted access to your master node. The `apiserver` doesn't do any authentication checking for insecure binds and traffic to the Insecure API port is not encrypted, allowing attackers to potentially read sensitive data in transit.

## Control impact_statement

Connections to the API server will require valid authentication credentials.

## Control remediation_procedure

None required.

## Control audit_procedure

The `openshift-kube-apiserver` is served over HTTPS with authentication and authorization; the secure API endpoint for the `penshift-kube-apiserver` is bound to `0.0.0.0:6443` by `default`. Note that the `openshift-apiserver` is not running in the host network namespace. The port is not exposed on the node, but only through the pod network.

Run the following command:

```
# InsecureBindAddress=true should not be in the results
oc get kubeapiservers.operator.openshift.io cluster -o jsonpath='{range .spec.observedConfig.apiServerArguments.feature-gates[*]}{@}{"\n"}{end}'

# Result should be only 6443
oc -n openshift-kube-apiserver get endpoints -o jsonpath='{.items[*].subsets[*].ports[*].port}'

# Result should be only 8443
oc -n openshift-apiserver get endpoints -o jsonpath='{.items[*].subsets[*].ports[*].port}'
```

Verify that the `--insecure-bind-address` argument does not exist.

Verify that the `bindAddress` is set to `6443` for the `openshift-kube-apiserver` and `8443` for the `openshift-apiserver`.

Note that the `openshift-apiserver` is not running in the host network namespace. The port is not exposed on the node, but only through the pod network.

## Control CIS_Controls

TITLE:Leverage Vetted Modules or Services for Application Security Components CONTROL:v8 16.11 DESCRIPTION:Leverage vetted modules or services for application security components, such as identity management, encryption, and auditing and logging. Using platform features in critical security functions will reduce developers’ workload and minimize the likelihood of design or implementation errors. Modern operating systems provide effective mechanisms for identification, authentication, and authorization and make those mechanisms available to applications. Use only standardized, currently accepted, and extensively reviewed encryption algorithms. Operating systems also provide mechanisms to create and maintain secure audit logs.;TITLE:Ensure Only Approved Ports, Protocols and Services Are Running CONTROL:v7 9.2 DESCRIPTION:Ensure that only network ports, protocols, and services listening on a system with validated business needs, are running on each system.;

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
