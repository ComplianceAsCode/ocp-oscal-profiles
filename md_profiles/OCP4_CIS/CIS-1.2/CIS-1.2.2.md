---
x-trestle-global:
  profile:
    title: OCP4 CIS Profile
---

# CIS-1.2.2 - \[API Server\] Ensure that the --basic-auth-file argument is not set

## Control Statement

Do not use basic authentication.

## Control rationale_statement

Basic authentication uses plaintext credentials for authentication. Currently, the basic authentication credentials last indefinitely, and the password cannot be changed without restarting the API server. The basic authentication is currently supported for convenience. Hence, basic authentication should not be used.

## Control impact_statement

OpenShift uses tokens and certificates for authentication.

## Control remediation_procedure

None required. `--basic-auth-file` cannot be configured on OpenShift.

## Control audit_procedure

OpenShift provides it's own fully integrated authentication and authorization mechanism. The `apiserver` is protected by either requiring an OAuth token issued by the platform's integrated OAuth server or signed certificates. The `basic-auth-file` method is not enabled in OpenShift. 

Run the following command:

```
oc -n openshift-kube-apiserver get cm config -o yaml | grep --color "basic-auth"
oc -n openshift-apiserver get cm config -o yaml | grep --color "basic-auth"
oc get clusteroperator authentication
```

Verify that the `--basic-auth-file` argument does not exist. 

Verify that the `authentication-operator` is running: Available is True.

## Control CIS_Controls

TITLE:Securely Manage Enterprise Assets and Software CONTROL:v8 4.6 DESCRIPTION:Securely manage enterprise assets and software. Example implementations include managing configuration through version-controlled-infrastructure-as-code and accessing administrative interfaces over secure network protocols, such as Secure Shell (SSH) and Hypertext Transfer Protocol Secure (HTTPS). Do not use insecure management protocols, such as Telnet (Teletype Network) and HTTP, unless operationally essential.;TITLE:Encrypt or Hash all Authentication Credentials CONTROL:v7 16.4 DESCRIPTION:Encrypt or hash with a salt all authentication credentials when stored.;

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
