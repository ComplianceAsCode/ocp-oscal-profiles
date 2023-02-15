---
x-trestle-global:
  profile:
    title: OCP4 CIS Node Profile
---

# CIS-1.1.19 - \[Master Node Configuration Files\] Ensure that the OpenShift PKI directory and file ownership is set to root:root

## Control Statement

Ensure that the OpenShift PKI directory and file ownership is set to `root:root`.

## Control rationale_statement

OpenShift makes use of a number of certificates as part of its operation. You should verify the ownership of the directory containing the PKI information and all files in that directory to maintain their integrity. The directory and files should be owned by `root:root`.

## Control impact_statement

None

## Control remediation_procedure

No remediation required; file permissions are managed by the operator.

## Control audit_procedure

Keys for control plane components deployed as static pods, `kube-apiserver`, `kube-controller-manager`, and `openshift-kube-scheduler` are stored in the directory `/etc/kubernetes/static-pod-certs/secrets`. The directory and file ownership are set to `root:root`.

Run the following command.

```
# Should return root:root for all files and directories

for i in $(oc -n openshift-kube-apiserver get pod -l app=openshift-kube-apiserver -o jsonpath='{.items[*].metadata.name}')
do
 echo $i static-pod-certs
 oc exec -n openshift-kube-apiserver $i -c kube-apiserver -- \
 find /etc/kubernetes/static-pod-certs -type d -wholename '*/secrets*' -exec stat -c %U:%G {} \;
 oc exec -n openshift-kube-apiserver $i -c kube-apiserver -- \
 find /etc/kubernetes/static-pod-certs -type f -wholename '*/secrets*' -exec stat -c %U:%G {} \;
 echo $i static-pod-resources
 oc exec -n openshift-kube-apiserver $i -c kube-apiserver -- \
 find /etc/kubernetes/static-pod-resources -type d -wholename '*/secrets*' -exec stat -c %U:%G {} \;
 oc exec -n openshift-kube-apiserver $i -c kube-apiserver -- \
 find /etc/kubernetes/static-pod-resources -type f -wholename '*/secrets*' -exec stat -c %U:%G {} \;
done
```

Verify that the ownership of all files and directories in this hierarchy is set to `root:root`.

## Control CIS_Controls

TITLE:Restrict Administrator Privileges to Dedicated Administrator Accounts CONTROL:v8 5.4 DESCRIPTION:Restrict administrator privileges to dedicated administrator accounts on enterprise assets. Conduct general computing activities, such as internet browsing, email, and productivity suite use, from the user’s primary, non-privileged account.;TITLE:Ensure the Use of Dedicated Administrative Accounts CONTROL:v7 4.3 DESCRIPTION:Ensure that all users with administrative account access use a dedicated or secondary account for elevated activities. This account should only be used for administrative activities and not internet browsing, email, or similar activities.;

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
