$PWD/.java-buildpack/open_jdk_jre/bin/java $JAVA_OPTS \
-Dappdynamics.agent.applicationName="$(ruby -e "require 'json' ; a = JSON.parse(ENV['VCAP_APPLICATION']);puts \"#{a['space_name']}\"")" \
-Dappdynamics.agent.tierName="$(ruby -e "require 'json' ; a = JSON.parse(ENV['VCAP_APPLICATION']);puts \"#{a['application_name']}\"")" \
-Dappdynamics.agent.nodeName="$(ruby -e "require 'json' ; a = JSON.parse(ENV['VCAP_APPLICATION']);puts \"#{a['application_name']}:#{a['instance_index']}\"")" \
-Dappdynamics.agent.uniqueHostId="$(ruby -e "require 'json' ; a = JSON.parse(ENV['VCAP_APPLICATION']);puts \"#{a['application_name']}:#{a['instance_index']}\"")" \
-jar $PWD/machineagent.jar
