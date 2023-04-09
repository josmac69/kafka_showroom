ifdef_check = $(if $(SCRIPT),,@echo "SCRIPT variable is not set or empty"; exit 1)

COMPOSE_FILE_SINGLE_SINGLE = zk-single-kafka-single.yml
COMPOSE_FILE_SINGLE_MULTI = zk-single-kafka-multiple.yml
KAFKA_PYTHON_IMAGE = kafka_showroom_python
DOCKER_NETWORK = kafka_showroom

.PHONY: start-single-single \
	start-single-multi \
	stop-single-single \
	stop-single-multi \
	create-network \
	build-python \
	run-python

start-single-single:
	docker compose -f $(COMPOSE_FILE_SINGLE_SINGLE) up -d

start-single-multi:
	docker compose -f $(COMPOSE_FILE_SINGLE_MULTI) up -d

stop-single-single:
	docker compose -f $(COMPOSE_FILE_SINGLE_SINGLE) down

stop-single-multi:
	docker compose -f $(COMPOSE_FILE_SINGLE_MULTI) down

create-network:
	mkdir -p data_inputs data_outputs secrets
	chmod 777 data_inputs data_outputs secrets
	docker network inspect $(DOCKER_NETWORK) >/dev/null 2>&1 || docker network create $(DOCKER_NETWORK)

build-python:
	docker build --progress=plain --no-cache -t "$(KAFKA_PYTHON_IMAGE)" -f Dockerfile.python .

run-python: create-network
	$(call ifdef_check)
	docker run -it --rm \
	--net $(DOCKER_NETWORK) \
	-v "${PWD}/data_inputs/":"/inputs" \
	-v "${PWD}/data_outputs/":"/outputs" \
	-v "${PWD}/secrets":/secrets \
	-v "${PWD}/$(SCRIPT)":/app \
	"$(KAFKA_PYTHON_IMAGE)"
