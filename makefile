## Setup Command ----------------------------------------------------------------

build_apk = fvm flutter build apk --shrink --obfuscate --split-debug-info=1.0.0

ensure_flutter_version: ## Install and use required flutter version for the project 
	fvm install 3.13.9
	fvm use 3.13.9

clean: ## Clean the flutter project
	fvm flutter clean 

pubs: ## Gets all the flutter packages
	fvm flutter pub get 

build_runner: 
	fvm flutter pub run build_runner build --delete-conflicting-outputs

build_runner_watch: 
	fvm flutter pub run build_runner watch --delete-conflicting-outputs

format: 
	fvm dart format lib test

rebuild: ## Rebuild the project
	ensure_flutter_version pubs build_runner format

build_dev_apk: ## Create dev APK
	${build_apk} --flavor dev --target lib/main_dev.dart --dart-define-from-file .secrets/dev.json

build_staging_apk: ## Create staging APK
	${build_apk} --flavor staging --target lib/main_staging.dart --dart-define-from-file .secrets/staging.json

## Do not use this if you will going to test the app
## Use either [build_dev_apk] or [build_staging_apk]
build_prod_apk: ## Create prod APK
	${build_apk} --flavor prod --target lib/main_prod.dart --dart-define-from-file .secrets/prod.json