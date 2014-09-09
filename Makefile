BIN := ./node_modules/.bin
TEST_FILES := test/support/env.js $(shell find test/specs -type f -name "*.js")

VERSION := $(shell node -e "console.log(require('./package.json').version)")

.PHONY: cover test lint

test:
	@$(BIN)/mocha --colors $(TEST_FILES)

cover:
	@$(BIN)/istanbul cover $(BIN)/_mocha $(TEST_FILES) -- -R spec

lint:
	@$(BIN)/jshint ./lib

bundle:
	@$(BIN)/browserify lib/spark-browser.js -t cssify -o dist/spark-browser-bundle.js
