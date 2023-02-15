---
x-trestle-global:
  profile:
    title: OCP4 CIS Profile
---

# CIS-5.1.5 - \[RBAC and Service Accounts\] Ensure that default service accounts are not actively used.

## Control Statement

The `default` service account should not be used to ensure that rights granted to applications can be more easily audited and reviewed.

## Control rationale_statement

Kubernetes provides a `default` service account which is used by cluster workloads where no specific service account is assigned to the pod.

Where access to the Kubernetes API from a pod is required, a specific service account should be created for that pod, and rights granted to that service account.

The default service account should be configured such that it does not provide a service account token and does not have any explicit rights assignments.

## Control impact_statement

All workloads which require access to the Kubernetes API will require an explicit service account to be created.

## Control remediation_procedure

None required.

## Control audit_procedure

Every OpenShift project has its own service accounts. Every service account has an associated user name that can be granted roles, just like a regular user. The user name for each service account is derived from its project and the name of the service account. Service accounts are required in each project to run builds, deployments, and other pods. The default service accounts that are automatically created for each project are isolated by the project namespace.

## Control CIS_Controls

TITLE:Disable Dormant Accounts CONTROL:v8 5.3 DESCRIPTION:Delete or disable any dormant accounts after a period of 45 days of inactivity, where supported.;TITLE:Disable Dormant Accounts CONTROL:v7 16.9 DESCRIPTION:Automatically disable dormant accounts after a set period of inactivity.;

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
