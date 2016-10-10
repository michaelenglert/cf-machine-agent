# AppDynamics Machine Agent to deploy as CloudFoundry App

The Machine Agent can be used within CloudFoundry to Host [AppDynamics Extensions](https://community.appdynamics.com/t5/eXchange-Community-AppDynamics/idb-p/extensions)

To deploy the Application to CloudFoundry the [Dist Zip Container](https://github.com/cloudfoundry/java-buildpack/blob/master/docs/container-dist_zip.md) of the [Java Buildpack](https://github.com/cloudfoundry/java-buildpack) is used.

## Prepare
1. Download the Machine Agent you want to use by
  * by `./get-agent.sh <Portal User> <Agent Version X.X.X.X>`
    * The Download Script will also disable the Default Monitors for getting Hardware Metrics in `monitors/*/monitor.xml`
  * by downloading manually and unzipping to this directory
2. [Alter the configuration as per documentation](https://docs.appdynamics.com/display/latest/Install+the+Standalone+Machine+Agent)
  * Change `conf/controller-info.xml`

## Deploy

1. `cf push <Application Name>`
  * The AppDynamics Application Name will be the `space_name` from `VCAP_APPLICATION` by default
  * The AppDynamics Application Name will be the `application_name` from `VCAP_APPLICATION` by default
  * The AppDynamics Node Name will be `application_name:instance_index` from `VCAP_APPLICATION` by default
  * The AppDynamics Unique Host ID will be `application_name:instance_index` from `VCAP_APPLICATION` by default

## Clean

1. Use `./clean.sh` to delete the Agent files
