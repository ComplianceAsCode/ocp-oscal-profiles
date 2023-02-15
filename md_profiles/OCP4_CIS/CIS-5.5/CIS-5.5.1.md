---
x-trestle-global:
  profile:
    title: OCP4 CIS Profile
---

# CIS-5.5.1 - \[Extensible Admission Control\] Configure Image Provenance using image controller configuration parameters

## Control Statement

Configure Image Provenance for your deployment.

## Control rationale_statement

Kubernetes supports plugging in provenance rules to accept or reject the images in your deployments. You could configure such rules to ensure that only approved images are deployed in the cluster.

You can control which images can be imported, tagged, and run in a cluster using the image controller. For additional information on the image controller, see [Image configuration resources](https://docs.openshift.com/container-platform/4.5/openshift_images/image-configuration.html)

## Control impact_statement

You need to regularly maintain your provenance configuration based on container image updates.

## Control remediation_procedure

Follow the OpenShift documentation: [Image configuration resources](https://docs.openshift.com/container-platform/4.5/openshift_images/image-configuration.html

## Control audit_procedure

Review the image controller parameters in your cluster and verify that image provenance is configured as appropriate.

## Control CIS_Controls

TITLE:Establish and Maintain a Secure Configuration Process CONTROL:v8 4.1 DESCRIPTION:Establish and maintain a secure configuration process for enterprise assets (end-user devices, including portable and mobile, non-computing/IoT devices, and servers) and software (operating systems and applications). Review and update documentation annually, or when significant enterprise changes occur that could impact this Safeguard.;TITLE:Deploy System Configuration Management Tools CONTROL:v7 5.4 DESCRIPTION:Deploy system configuration management tools that will automatically enforce and redeploy configuration settings to systems at regularly scheduled intervals.;

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
