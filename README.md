# logzio-docker-filebeat

logzio-docker-filebeat is a Docker container that uses Filebeat to collect logs from other Docker containers and ship those logs to your Logz.io account.

## Usage

### 1. Configure filebeat.yml

* Replace `<LOGZIO_TOKEN>` with your Logz.io [shipping token](https://docs.logz.io/user-guide/tokens/). 
* Replace `<LOGZIO_LISTENER_URL>` with the [listener](https://docs.logz.io/user-guide/accounts/account-region.html) URL that corresponds to your account region.
* Make any required changes to multiline event handling (lines 9-11). 
	* More information on handling multiline events with Filebeat is available [here](https://www.elastic.co/guide/en/beats/filebeat/current/multiline-examples.html)
	* Examples of multiline event handling in Filebeat can be found [here](https://www.elastic.co/guide/en/beats/filebeat/current/_examples_of_multiline_configuration.html)


### 2. Build the Docker image

```shell
docker build -t logz-docker-filebeat .
```

### 3. Run the container

```shell
docker run --name logzio-docker-filebeat \
-v /var/run/docker.sock:/var/run/docker.sock:ro \
-v /var/lib/docker/containers:/var/lib/docker/containers \
logzio/docker-collector-logs
```
