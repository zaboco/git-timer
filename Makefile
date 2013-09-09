
run: build
	@./bin/git-timer

build:
	@lsc -bco js/src src
	@lsc -bco js/spec spec

test: build
	@jasmine-node --noStack js

atest:
	@wr --exec 'make -s test' src spec

clean:
	@rm -rf js demo/demo.js

install:
	@./install.sh
