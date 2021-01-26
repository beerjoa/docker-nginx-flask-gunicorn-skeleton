.ONESHELL:

.PHONY: clean install tests run all

clean:
	find . -type f -name '*.pyc' -delete
	find . -type f -name '*.log' -delete
	find . -type f -name '*.pid' -delete
	find . -type d -name '__pycache__' -delete

tests:
	python app.py test

run:
	python app.py run

all: clean tests run