---
x-trestle-global:
  profile:
    title: OCP4 CIS Profile
---

# CIS-5.2.6 - \[Pod Security Policies\] Minimize the admission of root containers

## Control Statement

Do not generally permit containers to be run as the root user.

## Control rationale_statement

Containers may run as any Linux user. Containers which run as the root user, whilst constrained by Container Runtime security features still have an escalated likelihood of container breakout.

Ideally, all containers should run as a defined non-UID 0 user.

There should be at least one Security Context Constraint (SCC) defined which does not permit root users in a container.

If you need to run root containers, this should be defined in a separate SCC and you should carefully check RBAC controls to ensure that only limited service accounts and users are given permission to access that SCC.

## Control impact_statement

Pods with containers which run as the root user will not be permitted.

## Control remediation_procedure

None required. By default, OpenShift includes the non-root SCC with the the `Run As User Strategy` is set to either `MustRunAsNonRoot`. If additional SCCs are appropriate, follow the OpenShift documentation to create custom SCCs.

## Control audit_procedure

Get the set of SCCs with the following command:

```
oc get scc
```

For each SCC, check whether running containers as root is enabled:

```
# needs verification

for i in `oc get scc --template '{{range .items}}{{.metadata.name}}{{"\n"}}{{end}}'`; do echo "$i"; oc describe scc $i | grep "Run As User Strategy"; done

#For SCCs with MustRunAs verify that the range of UIDs does not include 0

for i in `oc get scc --template '{{range .items}}{{.metadata.name}}{{"\n"}}{{end}}'`; do echo "$i"; oc describe scc $i | grep "\sUID"; done
```

Verify that there is at least one SCC which returns `MustRunAsNonRoot` or one SCC which returns `MustRunAs` with the range of UIDs not including 0.

## Control CIS_Controls

TITLE:Restrict Administrator Privileges to Dedicated Administrator Accounts CONTROL:v8 5.4 DESCRIPTION:Restrict administrator privileges to dedicated administrator accounts on enterprise assets. Conduct general computing activities, such as internet browsing, email, and productivity suite use, from the user’s primary, non-privileged account.;

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
