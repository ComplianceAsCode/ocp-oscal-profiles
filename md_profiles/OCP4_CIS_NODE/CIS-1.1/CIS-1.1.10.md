---
x-trestle-global:
  profile:
    title: OCP4 CIS Node Profile
---

# CIS-1.1.10 - \[Master Node Configuration Files\] Ensure that the Container Network Interface file ownership is set to root:root

## Control Statement

Ensure that the Container Network Interface files have ownership set to `root:root`.

## Control rationale_statement

Container Network Interface provides various networking options for overlay networking. You should consult their documentation and restrict their respective file permissions to maintain the integrity of those files. Those files should be owned by `root:root`.

## Control impact_statement

None

## Control remediation_procedure

No remediation required; file permissions are managed by the operator.

## Control audit_procedure

The Cluster Network Operator (CNO) deploys and manages the cluster network components on an OpenShift Container Platform cluster. This includes the Container Network Interface (CNI) default network provider plug-in selected for the cluster during installation. OpenShift Container Platform uses the Multus CNI plug-in to allow chaining of CNI plug-ins. The default Pod network must be configured during cluster installation. By default, the CNO deploys the OpenShift SDN as the default Pod network. 

Ensure that the `multu` and `openshift-sdn` file ownership is set to root:root and the Open vSwitch (OVS) file ownership is set to `openvswitch:openvswitch`. 

The SDN components are deployed as DaemonSets across the master/worker nodes with controllers limited to control plane nodes. OpenShift deploys OVS as a network overlay by default. Various configurations (ConfigMaps and other files managed by the operator via `hostpath` but stored on the container hosts) are stored in the following locations:

CNI:

`/etc/cni/net.d`
`/host/var/run/multus/cni/net.d`

SDN:

`/var/lib/cni/networks/openshift-sdn `
`/var/run/openshift-sdn`

SDN OVS:

`/var/run/openvswitch`
`/etc/openvswitch`
`/run/openvswitch`

Run the following commands.

```

# For CNI multus
for i in $(oc get pods -n openshift-multus -l app=multus -oname); do oc exec -n openshift-multus $i -- /bin/bash -c "stat -c \"%U:%G %n\" /host/etc/cni/net.d/*.conf"; done

for i in $(oc get pods -n openshift-multus -l app=multus -oname); do oc exec -n openshift-multus $i -- /bin/bash -c "stat -c \"%U:%G %n\" /host/var/run/multus/cni/net.d/*.conf"; done

# For SDN pods
for i in $(oc get pods -n openshift-sdn -l app=sdn -oname); do oc exec -n openshift-sdn $i -- find /var/lib/cni/networks/openshift-sdn -type f -exec stat -c \"%U:%G\" {} \;; done

for i in $(oc get pods -n openshift-sdn -l app=sdn -oname); do oc exec -n openshift-sdn $i -- find /var/run/openshift-sdn -type f -exec stat -c %U:%G {} \;; done

# For OVS pods in 4.5
for i in $(oc get pods -n openshift-sdn -l app=ovs -oname); do oc exec -n openshift-sdn $i -- find /var/run/openvswitch -type f -exec stat -c %U:%G {} \;; done 

for i in $(oc get pods -n openshift-sdn -l app=ovs -oname); do oc exec -n openshift-sdn $i -- find /etc/openvswitch -type f -exec stat -c %U:%G {} \;; done 

for i in $(oc get pods -n openshift-sdn -l app=ovs -oname); do oc exec -n openshift-sdn $i -- find /run/openvswitch -type f -exec stat -c %U:%G {} \;; done 

# For OVS pods in 4.6
TBD
```

Verify that the CNI and SDN file ownership is set to `root:root`.

`/host/etc/cni/net.d/00-multus.conf = root:root`
`/host/var/run/multus/cni/net.d/80-openshift-network.conf = root:root`
`/var/lib/cni/networks/openshift-sdn = root:root`
`/var/run/openshift-sdn = root:root`

Verify that the OVS file ownership is set to `openvswitch:openvswitch`.

`/var/run/openvswitch = openvswitch:openvswitch`
`/etc/openvswitch = openvswitch:openvswitch`
`/run/openvswitch = openvswitch:openvswitch`

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
