---
x-trestle-global:
  profile:
    title: OCP4 CIS Profile
---

# CIS-1.2.10 - \[API Server\] Ensure that the APIPriorityAndFairness feature gate is enabled

## Control Statement

Limit the rate at which the API server accepts requests.

## Control rationale_statement

Using `EventRateLimit` admission control enforces a limit on the number of events that the API Server will accept in a given time slice. A misbehaving workload could overwhelm and DoS the API Server, making it unavailable. This particularly applies to a multi-tenant cluster, where there might be a small percentage of misbehaving tenants which could have a significant impact on the performance of the cluster overall. Hence, it is recommended to limit the rate of events that the API server will accept.

Note: This is an Alpha feature in the Kubernetes 1.15 release.

## Control impact_statement

None, as the OpenShift kubelet has been fixed to send fewer requests.

## Control remediation_procedure

No remediation is required.

## Control audit_procedure

EventRateLimit admission plugin cannot be enabled in Openshift. It was developed to alleviate the potential issue of flooding the API server with requests. However, the kubelet has since been fixed to send fewer events. OpenShift 4.5 and forward uses the api priority and fairness feature to limit the rate at which the API server accepts requests.

Run the following command:

```
#Verify the APIPriorityAndFairness feature-gate
oc get kubeapiservers.operator.openshift.io cluster -o json | jq '.spec.observedConfig.apiServerArguments'

#Verify the set of admission-plugins for OCP 4.6 and higher
oc -n openshift-kube-apiserver get configmap config -o json | jq -r '.data."config.yaml"' | jq '.apiServerArguments."enable-admission-plugins"'

#Check that no overrides are configured
oc get kubeapiservers.operator.openshift.io cluster -o json | jq -r '.spec.unsupportedConfigOverrides'
```

For 4.5, verify that the feature-gate is turned on for the APIServer priority and fairness: `APIPriorityAndFairness=true`. In OCP 4.5 and earlier, the default set of admission plugins are compiled into the `apiserver` and are not visible in the configuration yaml.

For 4.6 and above, verify that the set of admission plugins does not include `EventRateLimit`. 

Verify that no unsupported Overrides are configured.

## Control CIS_Controls

TITLE:Use of Secure Network Management and Communication Protocols  CONTROL:v8 12.6 DESCRIPTION:Use secure network management and communication protocols (e.g., 802.1X, Wi-Fi Protected Access 2 (WPA2) Enterprise or greater).;TITLE:Enable Operating System Anti-Exploitation Features/ Deploy Anti-Exploit Technologies CONTROL:v7 8.3 DESCRIPTION:Enable anti-exploitation features such as Data Execution Prevention (DEP) or Address Space Layout Randomization (ASLR) that are available in an operating system or deploy appropriate toolkits that can be configured to apply protection to a broader set of applications and executables.;

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
