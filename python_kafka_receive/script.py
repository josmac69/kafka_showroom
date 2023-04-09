from confluent_kafka import Consumer, KafkaError
import json

# Read Kafka configuration from external file
with open('/secrets/kafka_config.json', 'r') as f:
    config = json.load(f)
    kafka_config = config['kafka_config']
    topic_name = config['topic_name']

# Configure the Kafka consumer
consumer_config = {'bootstrap.servers': kafka_config['bootstrap.servers'], 'group.id': 'my_group', 'auto.offset.reset': 'earliest'}

# Create a Kafka consumer instance
consumer = Consumer(consumer_config)

# Subscribe to the Kafka topic
consumer.subscribe([topic_name])

# Consume messages from Kafka
try:
    while True:
        msg = consumer.poll(1.0)
        if msg is None:
            continue
        if msg.error():
            if msg.error().code() == KafkaError._PARTITION_EOF:
                print('Reached end of partition')
            else:
                print('Error while consuming message: {}'.format(msg.error()))
        else:
            print('Received message: {}'.format(msg.value().decode('utf-8')))
except KeyboardInterrupt:
    pass

# Close the Kafka consumer instance
consumer.close()
