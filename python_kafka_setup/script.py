from confluent_kafka.admin import AdminClient, NewTopic
import json

# Read Kafka configuration and topic name from external file
with open('/secrets/kafka_config.json', 'r') as f:
    config = json.load(f)
    kafka_config = config['kafka_config']
    topic_name = config['topic_name']
    topic_partitions = config['topic_partitions']
    topic_replication_factor = config['topic_replication_factor']
    topic_config = config['topic_config']

# Configure the Kafka cluster
admin_client = AdminClient(kafka_config)

# Create a new Kafka topic
new_topic = NewTopic(topic_name, num_partitions=topic_partitions, replication_factor=topic_replication_factor, config=topic_config)
admin_client.create_topics([new_topic])
