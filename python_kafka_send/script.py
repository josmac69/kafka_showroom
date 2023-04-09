from confluent_kafka import Producer
import json

# Read Kafka configuration and topic name from external file
with open('/secrets/kafka_config.json', 'r') as f:
    config = json.load(f)
    kafka_config = config['kafka_config']
    topic_name = config['topic_name']

# Configure the Kafka producer
producer = Producer(kafka_config)

# Send messages to the Kafka topic
messages = ['message1', 'message2', 'message3']
for message in messages:
    producer.produce(topic_name, message.encode('utf-8'))
producer.flush()

# Close the Kafka producer instance
producer.close()
