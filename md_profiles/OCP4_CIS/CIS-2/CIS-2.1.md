---
x-trestle-global:
  profile:
    title: OCP4 CIS Profile
---

# CIS-2.1 - \[etcd\] Ensure that the --cert-file and --key-file arguments are set as appropriate

## Control Statement

Configure TLS encryption for the `etcd` service.

## Control rationale_statement

`etcd` is a highly-available key value store used by Kubernetes deployments for persistent storage of all of its REST API objects. These objects are sensitive in nature and should be encrypted in transit.

## Control impact_statement

Client connections only over TLS would be served.

## Control remediation_procedure

OpenShift does not use the `etcd-certfile` or `etcd-keyfil`e flags. Certificates for `etcd` are managed by the `etcd` cluster operator.

## Control audit_procedure

OpenShift uses X.509 certificates to provide secure communication to `etcd`. OpenShift generates these files and sets the arguments appropriately. OpenShift does not use the `etcd-certfile` or `etcd-keyfile` flags. 

Keys and certificates for control plane components like `kube-apiserver`, `kube-controller-manager`, `kube-scheduler` and `etcd` are stored with their respective static pod configurations in the directory `/etc/kubernetes/static-pod-resources/*/secrets`. 

Run the following command:

```

# For --cert-file
for i in $(oc get pods -oname -n openshift-etcd)
do
 oc exec -n openshift-etcd -c etcd $i -- \
 ps -o command= -C etcd | sed 's/.*\(--cert-file=[^ ]*\).*/\1/'
done

# For --key-file
for i in $(oc get pods -oname -n openshift-etcd)
do
 oc exec -n openshift-etcd -c etcd $i -- \
 ps -o command= -C etcd | sed 's/.*\(--key-file=[^ ]*\).*/\1/'
done
```

Verify that cert-file and key-file values are returned for each etcd member.
`--cert-file=/etc/kubernetes/static-pod-certs/secrets/etcd-all-serving/etcd-serving-${ETCD_DNS_NAME}.crt`
`--key-file=/etc/kubernetes/static-pod-certs/secrets/etcd-all-serving/etcd-serving-${ETCD_DNS_NAME}.key`

For example:

`--cert-file=/etc/kubernetes/static-pod-certs/secrets/etcd-all-serving/etcd-serving-ip-10-0-165-75.us-east-2.compute.internal.crt`
`--key-file=/etc/kubernetes/static-pod-certs/secrets/etcd-all-serving/etcd-serving-ip-10-0-165-75.us-east-2.compute.internal.key`

## Control CIS_Controls

TITLE:Encrypt Sensitive Data at Rest CONTROL:v8 3.11 DESCRIPTION:Encrypt sensitive data at rest on servers, applications, and databases containing sensitive data. Storage-layer encryption, also known as server-side encryption, meets the minimum requirement of this Safeguard. Additional encryption methods may include application-layer encryption, also known as client-side encryption, where access to the data storage device(s) does not permit access to the plain-text data. ;TITLE:Encrypt All Sensitive Information in Transit CONTROL:v7 14.4 DESCRIPTION:Encrypt all sensitive information in transit.;

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
