# docker-graylog

see: http://docs.graylog.org/en/3.2/pages/configuration/elasticsearch.html


Default username: `admin`  
Default password: `admin`


Get default Graylog config
```bash
wget https://raw.githubusercontent.com/Graylog2/graylog-docker/3.2/config/graylog.conf
wget https://raw.githubusercontent.com/Graylog2/graylog-docker/3.2/config/log4j2.xml
```


Create mongo database and user
`docker exec -it standalone.mongodb.graylog /bin/bash`
```text
show databases;

use graylog;

db.createUser(
  {
    user: "admin",
    pwd: "admin_pass",
    roles: [ { role: "root", db: "admin" } ]
  }
)

exit
```


kafka.common.KafkaException: Failed to acquire lock on file .lock in /usr/share/graylog/data/journal.
A Kafka instance in another process or thread is using this directory.

```bash
rm -f /var/opt/graylog/data/journal/.lock
rm -f /var/opt/graylog/data/journal/.kafka_cleanshutdown
```

If not works, you need to delete every thing within /var/opt/graylog/data/journal directory.