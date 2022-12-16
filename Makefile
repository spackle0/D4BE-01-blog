#MIN_COVERAGE = 80
MIN_COVERAGE = 0
VERSION = 0.1.0
APP=d4be-blog

.PHONY: run
run:
	poetry run python manage.py runserver

##
## DEVELOPMENT
##

.PHONY: sqlmigrate
sqlmigrate:
	# Change to the migration you want to see the SQL for
	python manage.py sqlmigrate blog 0001

# Format with black and sort imports
.PHONY: format
format:
	@echo =========================
	@echo "Formatting..."
	@echo =========================
	#poetry run isort --skip migrations mysite/blog
	poetry run black --exclude="migrations/" mysite/blog

# Run unit tests
.PHONY: test
test:
	@echo =========================
	@echo "Running unit tests..."
	@echo =========================
	#poetry run pytest tests/

# Check tests' coverage of all application code
.PHONY: coverage
coverage:
	@echo =========================
	@echo "Running test coverage..."
	@echo =========================
	#poetry run pytest --cov --cov-fail-under=${MIN_COVERAGE} tests/

# Code linter
.PHONY: lint
lint:
	@echo =========================
	@echo "Running linters..."
	@echo =========================
	#poetry run pylint ch**/*.py
	#poetry run flake8 ch**/*.py

##
## SECURITY
##

# Check for known vulnerabilities in installed dependencies
.PHONY: safety
safety:
	@echo =========================
	@echo "Running safety..."
	@echo =========================
	#poetry run safety check

# Check for a set of known bad coding practices
.PHONY: bandit
bandit:
	@echo =========================
	@echo "Running bandit..."
	@echo =========================
	#poetry run bandit -r ${APP}/

.PHONY: sec
sec: safety bandit
	@echo =========================
	@echo "Security checks complete"
	@echo =========================
