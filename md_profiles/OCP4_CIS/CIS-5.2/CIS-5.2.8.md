---
x-trestle-global:
  profile:
    title: OCP4 CIS Profile
---

# CIS-5.2.8 - \[Pod Security Policies\] Minimize the admission of containers with added capabilities

## Control Statement

Do not generally permit containers with capabilities assigned beyond the default set.

## Control rationale_statement

Containers run with a default set of capabilities as assigned by the Container Runtime. Capabilities outside this set can be added to containers which could expose them to risks of container breakout attacks.

There should be at least one Security Context Constraint (SCC) defined which prevents containers with capabilities beyond the default set from launching.

If you need to run containers with additional capabilities, this should be defined in a separate SCC and you should carefully check RBAC controls to ensure that only limited service accounts and users are given permission to access that SCC.

## Control impact_statement

Pods with containers which require capabilities outside the default set will not be permitted.

## Control remediation_procedure

Ensure that `Allowed Capabilities` is set to an empty array for every SCC in the cluster except for the `privileged` SCC.

## Control audit_procedure

Get the set of SCCs with the following command:

```
oc get scc
```

For each SCC, check the values for `Allowed Capabilities`:

```

oc describe scc <name> | grep “Default Add Capabilities”

for i in `oc get scc --template '{{range .items}}{{.metadata.name}}{{"\n"}}{{end}}'`; do echo "$i"; oc describe scc $i | grep "Allowed Capabilities"; done

for i in `oc get scc --template '{{range .items}}{{.metadata.name}}{{"\n"}}{{end}}'`; do echo "$i"; oc describe scc $i | grep "Default Add Capabilities"; done
```

Minimize the number of SCCs that have `Allowed Capabilities` set to anything other than an empty array.

Minimize the number of SCCs that have `Default Add Capabilities` set to anything other than an empty array.

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
