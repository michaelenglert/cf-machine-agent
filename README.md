# AppDynamics Machine Agent to deploy as CloudFoundry App

The Machine Agent can be used within CloudFoundry to Host [AppDynamics Extensions](https://community.appdynamics.com/t5/eXchange-Community-AppDynamics/idb-p/extensions)


## Prepare
1. Download the Machine Agent you want to use by `./get-agent.sh <Portal User> <Agent Version X.X.X.X>`
  * The Download Script will also disable the Default Monitors for getting Hardware Metrics in `monitors/*/monitor.xml`
2. [Alter the configuration as per documentation](https://docs.appdynamics.com/display/latest/Installing+the+Database+Agent)
  * Change `conf/controller-info.xml`

## Deploy

1. `cf push <APP Name>`
  * The AppDynamics Application Name will be the `space_name` from `VCAP_APPLICATION` by default
  * The AppDynamics Application Name will be the `application_name` from `VCAP_APPLICATION` by default
  * The AppDynamics Node Name will be `application_name:instance_index` from `VCAP_APPLICATION` by default
  * The AppDynamics Unique Host ID will be `application_name:instance_index` from `VCAP_APPLICATION` by default

## Clean

1. Use `./clean.sh` to delete the Agent files
