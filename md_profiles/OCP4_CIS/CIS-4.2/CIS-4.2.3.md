---
x-trestle-global:
  profile:
    title: OCP4 CIS Profile
---

# CIS-4.2.3 - \[Kubelet\] Ensure that the --client-ca-file argument is set as appropriate

## Control Statement

Enable Kubelet authentication using certificates.

## Control rationale_statement

The connections from the apiserver to the kubelet are used for fetching logs for pods, attaching (through kubectl) to running pods, and using the kubelet’s port-forwarding functionality. These connections terminate at the kubelet’s HTTPS endpoint. By default, the apiserver does not verify the kubelet’s serving certificate, which makes the connection subject to man-in-the-middle attacks, and unsafe to run over untrusted and/or public networks. Enabling Kubelet certificate authentication ensures that the apiserver could authenticate the Kubelet before submitting any requests.

## Control impact_statement

You require TLS to be configured on apiserver as well as kubelets.

## Control remediation_procedure

None required. Changing the `clientCAFile` value is unsupported.

## Control audit_procedure

OpenShift provides integrated management of certificates for internal cluster components. OpenShift 4 includes multiple CAs providing independent chains of trust, which ensure that a platform CA will never accidentally sign a certificate that can be used for the wrong purpose, increasing the security posture of the cluster. The Client CA location for the kubelet is defined in `/etc/kubernetes/kubelet.conf`. 

Run the following command:

```

for node in $(oc get nodes -o jsonpath='{.items[*].metadata.name}')
do
 oc debug node/${node} -- chroot /host grep -B3 client-ca-file: /etc/systemd/system/kubelet.service
done
```

Verify that the `clientCAFile` exists and is set to `/etc/kubernetes/kubelet-ca.crt`. The output should look like the following:

```
apiVersion: kubelet.config.k8s.io/v1beta1
authentication:
 x509:
 clientCAFile: /etc/kubernetes/kubelet-ca.crt
```

## Control CIS_Controls

TITLE:Encrypt Sensitive Data at Rest CONTROL:v8 3.11 DESCRIPTION:Encrypt sensitive data at rest on servers, applications, and databases containing sensitive data. Storage-layer encryption, also known as server-side encryption, meets the minimum requirement of this Safeguard. Additional encryption methods may include application-layer encryption, also known as client-side encryption, where access to the data storage device(s) does not permit access to the plain-text data. ;TITLE:Encrypt Sensitive Information at Rest CONTROL:v7 14.8 DESCRIPTION:Encrypt all sensitive information at rest using a tool that requires a secondary authentication mechanism not integrated into the operating system, in order to access the information.;

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
