
auto-test:
	@wr --exec 'make -s test' src spec

build:
	@lsc -bco js/src src
	@lsc -bco js/spec spec

test: build
	@jasmine-node --noStack js

clean:
	@rm -rf js demo/demo.js

install:
	@./install.sh
