---
x-trestle-global:
  profile:
    title: OCP4 CIS Profile
---

# CIS-4.2.11 - \[Kubelet\] Ensure that the --rotate-certificates argument is not set to false

## Control Statement

Enable kubelet client certificate rotation.

## Control rationale_statement

The `--rotate-certificates` setting causes the kubelet to rotate its client certificates by creating new CSRs as its existing credentials expire. This automated periodic rotation ensures that the there is no downtime due to expired certificates and thus addressing availability in the CIA security triad.

Note: This recommendation only applies if you let kubelets get their certificates from the API server. In case your kubelet certificates come from an outside authority/tool (e.g. Vault) then you need to take care of rotation yourself.

## Control impact_statement

None

## Control remediation_procedure

None required.

## Control audit_procedure

This feature also requires the `RotateKubeletClientCertificate` feature gate to be enabled. The feature gate is enabled by default.

Run the following commands:

```

#Verify the rotateKubeletClientCertificate feature gate is not set to false
for node in $(oc get nodes -o jsonpath='{.items[*].metadata.name}')
do
 oc debug node/${node} -- chroot /host cat /etc/kubernetes/kubelet.conf | grep RotateKubeletClientCertificate
done

# Verify the rotateCertificates argument is set to true
for node in $(oc get nodes -o jsonpath='{.items[*].metadata.name}')
do
 oc debug node/${node} -- chroot host grep rotate /etc/kubernetes/kubelet.conf;
done
```

Verify that the `rotateKubeletClientCertificates` feature gate argument is not set to `false`.

Verify that the `rotateCertificates` argument is set to `true`.

## Control CIS_Controls

TITLE:Encrypt Sensitive Data in Transit CONTROL:v8 3.10 DESCRIPTION:Encrypt sensitive data in transit. Example implementations can include: Transport Layer Security (TLS) and Open Secure Shell (OpenSSH).;TITLE:Encrypt All Sensitive Information in Transit CONTROL:v7 14.4 DESCRIPTION:Encrypt all sensitive information in transit.;

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
