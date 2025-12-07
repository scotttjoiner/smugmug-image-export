PYTHON=python3
POETRY=poetry
PROJECT_NAME=smugpull

.PHONY: init fmt lint test run build requirements

init:
	$(POETRY) install --with dev

fmt:
	$(POETRY) run black .

lint:
	$(POETRY) run flake8 src tes

test:
	$(POETRY) run pytest

run:
	$(POETRY) run $(PROJECT_NAME) --help

build:
	$(POETRY) build

clean:
	find . -type d -name "__pycache__" -exec rm -r {} +
	rm -rf dist *.egg-info .pytest_cache .mypy_cache

requirements:
	$(POETRY) export -f requirements.txt --output requirements.txt --without-hashes

hooks:
	$(POETRY) run pre-commit install --install-hooks
