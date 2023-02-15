---
x-trestle-global:
  profile:
    title: OCP4 CIS Profile
---

# CIS-1.2.23 - \[API Server\] Ensure that the audit logs are forwarded off the cluster for retention

## Control Statement

Retain the logs for at least 30 days or as appropriate.

## Control rationale_statement

Retaining logs for at least 30 days ensures that you can go back in time and investigate or correlate any events. Set your audit log retention period to 30 days or as per your business requirements.

## Control impact_statement

None

## Control remediation_procedure

Follow the documentation for log forwarding. [Forwarding logs to third party systems](https://docs.openshift.com/container-platform/4.5/logging/cluster-logging-external.html)

## Control audit_procedure

OpenShift audit works at the API server level, logging all requests coming to the server. Audit is on by default. Best practice is to ship audit logs off the cluster for retention. 

OpenShift includes the optional Cluster Logging operator and the `ElasticSearch` operator. OpenShift cluster logging can be configured to send logs to destinations outside of your OpenShift Container Platform cluster instead of the default `Elasticsearc`h log store using the following methods:

- Sending logs using the `Fluentd` forward protocol. You can create a `Configmap` to use the `Fluentd` forward protocol to securely send logs to an external logging aggregator that accepts the Fluent forward protocol.
- Sending logs using syslog. You can create a `Configmap` to use the syslog protocol to send logs to an external syslog (RFC 3164) server.

Alternatively, you can use the Log Forwarding API, currently in Technology Preview. The Log Forwarding API, which is easier to configure than the `Fluentd` protocol and syslog, exposes configuration for sending logs to the internal `lasticsearch` log store and to external `Fluentd` log aggregation solutions.

You cannot use the ConfigMap methods and the Log Forwarding API in the same cluster.

Verify that audit log forwarding is configured as appropriate.

## Control CIS_Controls

TITLE:Establish and Maintain an Audit Log Management Process CONTROL:v8 8.1 DESCRIPTION:Establish and maintain an audit log management process that defines the enterprise’s logging requirements. At a minimum, address the collection, review, and retention of audit logs for enterprise assets. Review and update documentation annually, or when significant enterprise changes occur that could impact this Safeguard.;TITLE:Ensure adequate storage for logs CONTROL:v7 6.4 DESCRIPTION:Ensure that all systems that store logs have adequate storage space for the logs generated.;

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
