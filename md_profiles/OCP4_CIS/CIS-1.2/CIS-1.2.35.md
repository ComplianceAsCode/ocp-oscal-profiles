---
x-trestle-global:
  profile:
    title: OCP4 CIS Profile
---

# CIS-1.2.35 - \[API Server\] Ensure that the API Server only makes use of Strong Cryptographic Ciphers

## Control Statement

Ensure that the API server is configured to only use strong cryptographic ciphers.

## Control rationale_statement

TLS ciphers have had a number of known vulnerabilities and weaknesses, which can reduce the protection provided by them. By default Kubernetes supports a number of TLS ciphersuites including some that have security concerns, weakening the protection provided.

## Control impact_statement

API server clients that cannot support the custom cryptographic ciphers will not be able to make connections to the API server.

## Control remediation_procedure

Follow the directions above and in the OpenShift documentation Configuring Ingress.

## Control audit_procedure

Ciphers for the API servers, authentication and the ingress controller can be configured using the `tlsSecurityProfile` parameter as of OpenShfit 4.3. The ingress controller provides external access to the API server. There are four TLS security profile types:

- Old
- Intermediate
- Modern
- Custom

Only the Old, Intermediate and Custom profiles are supported at this time. Custom provides the ability to specify individual TLS security profile parameters. Follow the steps in the documentation to configure the cipher suite for Ingress and the API server. [Ingress controller configuration parameters](https://docs.openshift.com/container-platform/4.5/networking/ingress-operator.html#nw-ingress-controller-configuration-parameters_configuring-ingress)

Run the following commands to verify the cipher suite and `minTLSversion` for the ingress operator, authentication operator, `cliconfig`, OpenShift `APIserver` and `Kube APIserver`.

```
# verify cipher suites
oc get cm -n openshift-authentication v4-0-config-system-cliconfig -o jsonpath='{.data.v4\-0\-config\-system\-cliconfig}' | jq .servingInfo
oc get kubeapiservers.operator.openshift.io cluster -o json |jq .spec.observedConfig.servingInfo
oc get openshiftapiservers.operator.openshift.io cluster -o json |jq .spec.observedConfig.servingInfo
oc describe --namespace=openshift-ingress-operator ingresscontroller/default
```

Verify that the `tlsSecurityProfile` is set to the value you chose. 

Note: The HAProxy Ingress controller image does not support TLS 1.3 and because the Modern profile requires TLS 1.3, it is not supported. The Ingress Operator converts the Modern profile to Intermediate. The Ingress Operator also converts the TLS 1.0 of an Old or Custom profile to 1.1, and TLS 1.3 of a Custom profile to 1.2.

## Control CIS_Controls

TITLE:Uninstall or Disable Unnecessary Services on Enterprise Assets and Software CONTROL:v8 4.8 DESCRIPTION:Uninstall or disable unnecessary services on enterprise assets and software, such as an unused file sharing service, web application module, or service function.;TITLE:Utilize Client Certificates to Authenticate Hardware Assets CONTROL:v7 1.8 DESCRIPTION:Use client certificates to authenticate hardware assets connecting to the organization's trusted network.;

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
