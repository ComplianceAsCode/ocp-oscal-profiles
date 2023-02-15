---
x-trestle-global:
  profile:
    title: OCP4 CIS Node Profile
---

# CIS-4.1.9 - \[Worker Node Configuration Files\] Ensure that the kubelet --config configuration file has permissions set to 600 or more restrictive

## Control Statement

Ensure that if the kubelet refers to a configuration file with the `--config` argument, that file has permissions of `600` or more restrictive.

## Control rationale_statement

The kubelet reads various parameters, including security settings, from a config file specified by the `--config` argument. If this file is specified you should restrict its file permissions to maintain the integrity of the file. The file should be writable by only the administrators on the system.

## Control impact_statement

None

## Control remediation_procedure

None required.

## Control audit_procedure

In OpenShift 4, the `kublet.conf` file is managed by the Machine Config Operator. The kubelet config file is found at `/var/lib/kubelet/config.json` with file permissions set to `600`.

Run the command:

```

for node in $(oc get nodes -o jsonpath='{.items[*].metadata.name}')
do
 oc debug node/${node} -- chroot /host stat -c %a /var/lib/kubelet/config.json
done
```

Verify that the permissions are `600`.

## Control CIS_Controls

TITLE:Maintain Secure Images CONTROL:v7 5.2 DESCRIPTION:Maintain secure images or templates for all systems in the enterprise based on the organization's approved configuration standards. Any new system deployment or existing system that becomes compromised should be imaged using one of those images or templates.;TITLE:Minimize And Sparingly Use Administrative Privileges CONTROL:v6 5.1 DESCRIPTION:Minimize administrative privileges and only use administrative accounts when they are required. Implement focused auditing on the use of administrative privileged functions and monitor for anomalous behavior.;

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
