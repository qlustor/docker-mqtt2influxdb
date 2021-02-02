# docker-mqtt2influxdb
A bridge between MQTT and InfluxDB
aka Dockerized BigClown tool for storage data from MQTT to InfluxDB

See: https://tower.hardwario.com/en/latest/tutorials/mqtt-to-influxdb/
And: https://pypi.org/project/mqtt2influxdb/

Exports volume /etc/hardwario with default values in mqtt2influxdb.yml YAML file which maps MQTT topics and values to Database(s), Measurements, Fields & Tags in InfluxDB per above or:

## Configuration file structure and possibilities
Here will be described possibilities in the configuration. In configuration you can use JSONPath. For example in measurement you can identify tag id from MQTT topic by syntax $.topic[1] as you can see in Step 4.

MQTT
MQTT part of the configuration file is where you define a connection to MQTT broker. mqtt2influxdb supports secured connection! This section is required.

mqtt:
    host: MQTT Broker adress (required)
    port: MQTT Broker port (required)
    username: Username to secured MQTT broker (optional)
    password: Users password to secured MQTT broker (optional)
    cafile: CA to secured MQTT broker (optional)
    certfile: Certificate to secured MQTT broker (optional)
    keyfile: Certificate Key file to secured MQTT broker (optional)
HTTP
You can define web hooks so data can be posted to your endpoint. This section is optional.

http:
    destination: Endpoint url (required)
    action: Request type (required)
    username: Username for secured request (optional)
    password: Password for secured request (optional)
InfluxDB
An important part of the config is of course the definition of InfluxDB connection. This section is required.

influxdb:
    host: InfluxDB adress (required)
    port: InfluxDB port (required)
    database: Database name (required)
    username: Username to InfluxDB (optional)
    password: Users password to InfluxDB (optional)
    ssl: SSL connection (optional)
Base64 Decode
Decode base64 messages. This section is optional.

base64decode:
    source: base64 coded message (required)
    target: encoded message (required)
Points
Points section is where you define messages you want to store in database. This section is required.

points:
    measurement: Measurement name in database (required)
    topic: Define MQTT topic where messages are posting to (required)
    httpcontent: Define payload in http request if filled in HTTP chapter (optional)
fields:
    value: Value field in InfluxDB (required)
    type: Variable type (required)
Tags
Tags are for identification measurement in database. This section is optional.

tags:
    id: ID field in InfluxDB (optional)
Database
For every measurement you can define specific database name. This field is optional.

database: Specific database to store measurement (optional)
