---
x-trestle-global:
  profile:
    title: OCP4 CIS Profile
---

# CIS-5.7.4 - \[General Policies\] The default namespace should not be used

## Control Statement

Kubernetes provides a default namespace, where objects are placed if no namespace is specified for them. Placing objects in this namespace makes application of RBAC and other controls more difficult.

## Control rationale_statement

Resources in a Kubernetes cluster should be segregated by namespace, to allow for security controls to be applied at that level and to make it easier to manage resources.

## Control impact_statement

None

## Control remediation_procedure

Ensure that namespaces are created to allow for appropriate segregation of Kubernetes resources and that all new resources are created in a specific namespace.

## Control audit_procedure

In OpenShift, projects (namespaces) are used to group and isolate related objects. When a request is made to create a new project using the web console or oc new-project command, an endpoint in OpenShift Container Platform is used to provision the project according to a template, which can be customized. 

The cluster administrator can allow and configure how developers and service accounts can create, or self-provision, their own projects. Regular users do not have access to the default project. 

Projects starting with openshift- and kube- host cluster components that run as Pods and other infrastructure components. As such, OpenShift does not allow you to create Projects starting with openshift- or kube- using the oc new-project command.

For more information, see 
[Working with projects](https://docs.openshift.com/container-platform/4.4/applications/projects/working-with-projects.html) and 
[Configuring project creation](https://docs.openshift.com/containerplatform/4.4/applications/projects/configuring-project-creation.html)

Run this command to list objects in default namespace

```
oc project default
oc get all 
```

The only entries there should be system managed resources such as the `kubernetes` and `openshift` service

## Control CIS_Controls

TITLE:Configure Trusted DNS Servers on Enterprise Assets CONTROL:v8 4.9 DESCRIPTION:Configure trusted DNS servers on enterprise assets. Example implementations include: configuring assets to use enterprise-controlled DNS servers and/or reputable externally accessible DNS servers. ;TITLE:Secure Configuration for Hardware and Software on Mobile Devices, Laptops, Workstations and Servers CONTROL:v7 5 DESCRIPTION:Secure Configuration for Hardware and Software on Mobile Devices, Laptops, Workstations and Servers;

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
