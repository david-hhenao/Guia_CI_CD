# Makefile
# install:
# 	pip install -r requirements.txt

.PHONY: install format train validate evaluate ci cd

install:
	python -m pip install --upgrade pip
	pip install -r requirements.txt

# Formateo (puedes empezar con check para no reescribir código en CI)
format:
	black .
	isort .

format-check:
	black --check .
	isort --check-only .

train:
	python src/train.py

validate:
	python src/validate.py

# Aliases para el paso de Actions
evaluate: validate
eval: evaluate

# ci: install train validate
ci: install format-check train evaluate

cd:
	@echo "Aquí iría el comando de promoción o despliegue del modelo"
	@echo "Por ejemplo: mlflow models serve ..."