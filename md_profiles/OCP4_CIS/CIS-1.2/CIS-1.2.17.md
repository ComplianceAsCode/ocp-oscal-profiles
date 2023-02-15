---
x-trestle-global:
  profile:
    title: OCP4 CIS Profile
---

# CIS-1.2.17 - \[API Server\] Ensure that the admission control plugin NodeRestriction is set

## Control Statement

Limit the `Node` and `Pod` objects that a kubelet could modify.

## Control rationale_statement

Using the `NodeRestriction` plug-in ensures that the kubelet is restricted to the `Node` and `Pod` objects that it could modify as defined. Such kubelets will only be allowed to modify their own `Node` API object, and only modify `Pod` API objects that are bound to their node.

## Control impact_statement

None

## Control remediation_procedure

The `NodeRestriction` plugin cannot be disabled.

## Control audit_procedure

In OpenShift, the `NodeRestriction` admission plugin is enabled by default.

Run the following command:

````
# For 4.5, review the control plane manifest
https://github.com/openshift/origin/blob/release-4.5/vendor/k8s.io/kubernetes/cmd/kubeadm/app/phases/controlplane/manifests.go#L132

#Verify the set of admission-plugins for OCP 4.6 and higher
oc -n openshift-kube-apiserver get configmap config -o json | jq -r '.data."config.yaml"' | jq '.apiServerArguments."enable-admission-plugins"'

#Check that no overrides are configured
oc get kubeapiservers.operator.openshift.io cluster -o json | jq -r '.spec.unsupportedConfigOverrides'
````

In OCP 4.5 and earlier, the default set of admission plugins are compiled into the `apiserver` and are not visible in the configuration yaml. 

For 4.6 and above, verify that the set of admission plugins includes `NodeRestriction` and that the `--disable-admission-plugins` argument is set to a value that does not include `NodeRestriction`. 

Verify that no unsupported Overrides are configured.

## Control CIS_Controls

TITLE:Leverage Vetted Modules or Services for Application Security Components CONTROL:v8 16.11 DESCRIPTION:Leverage vetted modules or services for application security components, such as identity management, encryption, and auditing and logging. Using platform features in critical security functions will reduce developers’ workload and minimize the likelihood of design or implementation errors. Modern operating systems provide effective mechanisms for identification, authentication, and authorization and make those mechanisms available to applications. Use only standardized, currently accepted, and extensively reviewed encryption algorithms. Operating systems also provide mechanisms to create and maintain secure audit logs.;TITLE:Apply Host-based Firewalls or Port Filtering CONTROL:v7 9.4 DESCRIPTION:Apply host-based firewalls or port filtering tools on end systems, with a default-deny rule that drops all traffic except those services and ports that are explicitly allowed.;

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
