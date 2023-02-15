---
x-trestle-global:
  profile-title: ROKS OCP4 Tailored Profile
---

# CIS-4.2.6 - \[\] Ensure that the --protect-kernel-defaults argument is not set

## Control Statement

Protect tuned kernel parameters from overriding kubelet default kernel parameter values.

## Control rationale_statement

Kernel parameters are usually tuned and hardened by the system administrators before putting the systems into production. These parameters protect the kernel and the system. Your kubelet kernel defaults that rely on such parameters should be appropriately set to match the desired secured system state. Ignoring this could potentially lead to running pods with undesired kernel behavior.

## Control impact_statement

You would have to re-tune kernel parameters to match kubelet parameters.

## Control remediation_procedure

None required. The OpenShift 4 kubelet modifies the system tunable; using the `protect-kernel-defaults` flag will cause the kubelet to fail on start if the tunables don't match the kubelet configuration and the OpenShift node will fail to start.

## Control audit_procedure

The OpenShift 4 kubelet modifies the system tunable; using the `protect-kernel-defaults` flag will cause the kubelet to fail on start if the tunables don't match the kubelet configuration and the OpenShift node will fail to start.

Run the following command:

```
for node in $(oc get nodes -o jsonpath='{.items[*].metadata.name}'); do oc debug node/${node} -- chroot /host more /etc/kubernetes/kubelet.conf; done
```

Verify that protectKernelDefaults is not present.

## Control CIS_Controls

TITLE:Perform Automated Operating System Patch Management CONTROL:v8 7.3 DESCRIPTION:Perform operating system updates on enterprise assets through automated patch management on a monthly, or more frequent, basis.;TITLE:Deploy Automated Operating System Patch Management Tools CONTROL:v7 3.4 DESCRIPTION:Deploy automated software update tools in order to ensure that the operating systems are running the most recent security updates provided by the software vendor.;

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
