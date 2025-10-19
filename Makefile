# Makefile
# install:
# 	pip install -r requirements.txt

.PHONY: install format train validate evaluate ci cd

install:
	python -m pip install --upgrade pip
	pip install -r requirements.txt

# Formateo (puedes empezar con check para no reescribir código en CI)
format:
	black --check .
	isort --check-only .

train:
	python src/train.py

validate:
	python src/validate.py

# ci: install train validate
ci: install format train evaluate

cd:
	@echo "Aquí iría el comando de promoción o despliegue del modelo"
	@echo "Por ejemplo: mlflow models serve ..."