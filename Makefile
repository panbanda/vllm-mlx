VENV := .venv
PYTHON := $(VENV)/bin/python
PIP := $(VENV)/bin/pip
MODEL ?= mlx-community/Qwen3-Coder-Next-4bit
PORT ?= 8000

.PHONY: serve install test clean

serve: $(VENV)
	$(VENV)/bin/vllm-mlx serve $(MODEL) --port $(PORT)

install: $(VENV)

$(VENV):
	python -m venv $(VENV)
	$(PIP) install -e .

test: $(VENV)
	$(VENV)/bin/pytest

clean:
	rm -rf $(VENV)
