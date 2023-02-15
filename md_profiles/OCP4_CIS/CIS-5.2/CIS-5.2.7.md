---
x-trestle-global:
  profile:
    title: OCP4 CIS Profile
---

# CIS-5.2.7 - \[Pod Security Policies\] Minimize the admission of containers with the NET_RAW capability

## Control Statement

Do not generally permit containers with the potentially dangerous NET_RAW capability.

## Control rationale_statement

Containers run with a default set of capabilities as assigned by the Container Runtime. By default this can include potentially dangerous capabilities. With Docker as the container runtime the NET_RAW capability is enabled which may be misused by malicious containers.

Ideally, all containers should drop this capability.

There should be at least one Security Context Constraint (SCC) defined which prevents containers with the NET_RAW capability from launching.

If you need to run containers with this capability, this should be defined in a separate SCC and you should carefully check RBAC controls to ensure that only limited service accounts and users are given permission to access that SCC.

## Control impact_statement

Pods with containers which run with the NET_RAW capability will not be permitted.

## Control remediation_procedure

Create a SCC as described in the OpenShift documentation, ensuring that the `Required Drop Capabilities` is set to include either `NET_RAW` or `ALL`.

## Control audit_procedure

Get the set of SCCs with the following command:

```
oc get scc
```

For each SCC, check whether `NET_RAW` is disabled:

```
# needs verification
for i in `oc get scc --template '{{range .items}}{{.metadata.name}}{{"\n"}}{{end}}'`; do echo "$i"; oc describe scc $i | grep "Required Drop Capabilities"; done
```

Verify that there is at least one SCC which returns `NET_RAW` or `ALL`.

## Control CIS_Controls

TITLE:Uninstall or Disable Unnecessary Services on Enterprise Assets and Software CONTROL:v8 4.8 DESCRIPTION:Uninstall or disable unnecessary services on enterprise assets and software, such as an unused file sharing service, web application module, or service function.;TITLE:Maintain Secure Images CONTROL:v7 5.2 DESCRIPTION:Maintain secure images or templates for all systems in the enterprise based on the organization's approved configuration standards. Any new system deployment or existing system that becomes compromised should be imaged using one of those images or templates.;

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
