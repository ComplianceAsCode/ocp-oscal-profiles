---
x-trestle-global:
  profile:
    title: OCP4 CIS Node Profile
---

# CIS-1.1.5 - \[Master Node Configuration Files\] Ensure that the scheduler pod specification file permissions are set to 600 or more restrictive

## Control Statement

Ensure that the scheduler pod specification file has permissions of `600` or more restrictive.

## Control rationale_statement

The scheduler pod specification file controls various parameters that set the behavior of the Scheduler service in the master node. You should restrict its file permissions to maintain the integrity of the file. The file should be writable by only the administrators on the system.

## Control impact_statement

None

## Control remediation_procedure

execute command:

```
chmod 600 /etc/kubernetes/static-pod-resources/kube-scheduler-pod.yaml
```

## Control audit_procedure

In OpenShift 4 the kube-scheduler is deployed as a static pod and its pod specification file is created on control plane nodes at /etc/kubernetes/manifests/kube-scheduler-pod.yaml. It is mounted via hostpath to the kube-controller-manager pods via /etc/kubernetes/static-pod-resources/kube-scheduler-pod.yaml with permissions 0644.

To verify, run the following command. 

```
#Verify openshift-kube-scheduler permissions

for i in $(oc get pods -n openshift-kube-scheduler -l app=openshift-kube-scheduler -o name)
 do
 oc exec -n openshift-kube-scheduler $i -- \
 stat -c %a /etc/kubernetes/static-pod-resources/kube-scheduler-pod.yaml
 done
```

Verify that the permissions are `600` or more restrictive.

## Control CIS_Controls

TITLE:Configure Data Access Control Lists CONTROL:v8 3.3 DESCRIPTION:Configure data access control lists based on a user’s need to know. Apply data access control lists, also known as access permissions, to local and remote file systems, databases, and applications.;TITLE:Protect Information through Access Control Lists CONTROL:v7 14.6 DESCRIPTION:Protect all information stored on systems with file system, network share, claims, application, or database specific access control lists. These controls will enforce the principle that only authorized individuals should have access to the information based on their need to access the information as a part of their responsibilities.;

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
