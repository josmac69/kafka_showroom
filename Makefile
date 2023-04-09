COMPOSE_FILE_SINGLE_SINGLE = zk-single-kafka-single.yml
COMPOSE_FILE_SINGLE_MULTI = zk-single-kafka-multiple.yml

.PHONY: start-single-single start-single-multi stop-single-single stop-single-multi

start-single-single:
	docker compose -f $(COMPOSE_FILE_SINGLE_SINGLE) up -d

start-single-multi:
	docker compose -f $(COMPOSE_FILE_SINGLE_MULTI) up -d

stop-single-single:
	docker compose -f $(COMPOSE_FILE_SINGLE_SINGLE) down

stop-single-multi:
	docker compose -f $(COMPOSE_FILE_SINGLE_MULTI) down
