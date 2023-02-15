---
x-trestle-global:
  profile:
    title: OCP4 CIS Profile
---

# CIS-5.2.4 - \[Pod Security Policies\] Minimize the admission of containers wishing to share the host network namespace

## Control Statement

Do not generally permit containers to be run with the `hostNetwork` flag set to true.

## Control rationale_statement

A container running in the host's network namespace could access the local loopback device, and could access network traffic to and from other pods.

There should be at least one Security Context Constraint (SCC) defined which does not permit containers to share the host network namespace.

If you have need to run containers which require hostNetwork, this should be defined in a separate SCC and you should carefully check RBAC controls to ensure that only limited service accounts and users are given permission to access that SCC.

## Control impact_statement

Pods defined with `Allow Host Network: true` will not be permitted unless they are run under a specific SCC.

## Control remediation_procedure

Create a SCC as described in the OpenShift documentation, ensuring that the `Allow Host Network` field is omitted or set to `false`.

## Control audit_procedure

Get the set of SCCs with the following command:

```
oc get scc
```

For each SCC, check whether `Allow Host Network` is enabled:

```
for i in `oc get scc --template '{{range .items}}{{.metadata.name}}{{"\n"}}{{end}}'`; do echo "$i"; oc describe scc $i | grep "Allow Host Network"; done
```

Verify that there is at least one SCC which does not return true.

## Control CIS_Controls

TITLE:Segment Data Processing and Storage Based on Sensitivity CONTROL:v8 3.12 DESCRIPTION:Segment data processing and storage based on the sensitivity of the data. Do not process sensitive data on enterprise assets intended for lower sensitivity data.;TITLE:Segment the Network Based on Sensitivity CONTROL:v7 14.1 DESCRIPTION:Segment the network based on the label or classification level of the information stored on the servers, locate all sensitive information on separated Virtual Local Area Networks (VLANs).;

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
