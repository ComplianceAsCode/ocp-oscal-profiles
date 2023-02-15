---
x-trestle-global:
  profile:
    title: OCP4 CIS Profile
---

# CIS-1.2.24 - \[API Server\] Ensure that the maximumRetainedFiles argument is set to 10 or as appropriate

## Control Statement

Retain 10 or an appropriate number of old log files.

## Control rationale_statement

Kubernetes automatically rotates the log files. Retaining old log files ensures that you would have sufficient log data available for carrying out any investigation or correlation. For example, if you have set file size of 100 MB and the number of old log files to keep as 10, you would have approximately 1 GB of log data that you could potentially use for your analysis.

## Control impact_statement

None

## Control remediation_procedure

Set the `maximumRetainedFiles` parameter to `10` or as an appropriate number of files.

```
maximumRetainedFiles: 10
```

## Control audit_procedure

OpenShift audit works at the API server level, logging all requests coming to the server. Configure via `maximumRetainedFiles`. 

Run the following command:

```
oc get configmap config -n openshift-kube-apiserver -ojson | \
 jq -r '.data["config.yaml"]' | \
 jq -r .auditConfig.maximumRetainedFiles

oc get configmap config -n openshift-apiserver -ojson | \
 jq -r '.data["config.yaml"]' | \
 jq -r .auditConfig.maximumRetainedFiles

for OCP 4.6 in place of jq -r .auditConfig.maximumRetainedFiles use:
 jq -r '.apiServerArguments["audit-log-maxbackup"][]?' 
```

Verify that `maximumRetainedFiles` is set to `10` or as appropriate.

## Control CIS_Controls

TITLE:Ensure Adequate Audit Log Storage CONTROL:v8 8.3 DESCRIPTION:Ensure that logging destinations maintain adequate storage to comply with the enterprise’s audit log management process.;TITLE:Ensure adequate storage for logs CONTROL:v7 6.4 DESCRIPTION:Ensure that all systems that store logs have adequate storage space for the logs generated.;

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
