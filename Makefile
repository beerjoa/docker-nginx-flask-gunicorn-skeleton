.ONESHELL:


UNAME := $(shell uname)
DEFAULT_NAME=centos-flask-temp
DEFAULT_TAG=latest

ifeq ($(UNAME), Darwin)
	SED_COMM=""
else
	SED_COMM= 
endif

.PHONY: test-all
.SILENT: clean pull_image build_image clean_image test_app test_all run


clean:
	find . -type f -name '*.pyc' -delete
	find . -type f -name '*.log' -delete
	find . -type f -name '*.pid' -delete
	find . -type d -name '__pycache__' -delete
	docker-compose down; 

pull_image:
	@echo "start 'pull_image' --> Pull docker images"
	@echo ""
	docker pull nginx:stable; 
	docker pull centos/python-38-centos7;

build_image:
	@echo "start 'build_image' --> Build docker image for flask app"
	@echo "os: $(UNAME)"
	@echo ""
	docker build -t $(or $(name), $(DEFAULT_NAME)):$(or $(tag), $(DEFAULT_TAG)) ./docker_image; 
	find . -name 'docker-compose.yml' -exec sed -i $(SED_COMM) 's/centos-flask-temp:latest/$(or $(name), centos-flask-temp):$(or $(tag), latest)/g' {} \;


clean_image:
	@echo "start 'clean_image' --> remove temp docker image"
	@echo ""
	docker rmi -f $(DEFAULT_NAME):$(DEFAULT_TAG)


test_app:
	@echo "start 'test_app' --> run flask app testing"
	@echo ""
	docker-compose up -d; \
	docker exec app1 bash -c 'pytest tests'; \
	docker-compose down;


test_all: clean \
	pull_image \
	build_image \
	test_app \
	clean_image


run:
	docker-compose up -d; \
	docker-compose logs -f;