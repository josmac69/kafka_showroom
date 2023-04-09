# Kafka showroom
Kafka streaming platform - my learnings, tests and examples

***

* This repository uses modified docker compose config yaml files from repository https://github.com/conduktor/kafka-stack-docker-compose
*

***

ChatGPT:

Kafka is an open-source distributed streaming platform that was originally developed by LinkedIn and later donated to the Apache Software Foundation. It is designed to handle large-scale real-time data processing and is used by many companies to build scalable and reliable data pipelines.

Here are some key features and concepts of Kafka:

* Distributed: Kafka is designed to be deployed as a distributed system, with multiple broker nodes that can be spread across multiple servers or data centers.

* Streaming: Kafka is a streaming platform, which means it can handle high-volume, real-time data streams. It can process millions of events per second and support near real-time processing.

* Publish/subscribe: Kafka uses a publish/subscribe model for messaging, where producers publish messages to topics, and consumers subscribe to topics to receive messages.

* Topics: Topics are the main way of organizing and partitioning data in Kafka. A topic is a category or feed name to which messages are published. Topics can be partitioned to allow for parallel processing of messages.

* Partitions: A partition is a unit of parallelism in Kafka. Each partition is an ordered, immutable sequence of messages that is continually appended to.

* Brokers: Brokers are the nodes in a Kafka cluster that store and serve the data. Each broker contains a subset of the partitions for each topic.

* Producers: Producers are the clients that publish messages to Kafka topics.

* Consumers: Consumers are the clients that subscribe to topics and consume messages from Kafka.

* Consumer groups: A consumer group is a set of consumers that work together to consume messages from a topic. Each consumer group receives a copy of each message in the topic, with each message going to only one consumer within the group.

Kafka is often used as a data pipeline for processing and analyzing large volumes of real-time data, such as logs, events, and metrics. It can be integrated with many different systems and platforms, including databases, message queues, and stream processing frameworks.