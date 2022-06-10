build:
	./helio/blaze.sh -release
	ninja -C build-opt dragonfly

pull:
	git stash
	git pull  --recurse-submodules
	git stash pop

run:
	./build-opt/dragonfly --alsologtostderr

compile-commands:
	ninja -C build-opt -t compdb > ./build-dbg/compile_commands.json

dev: build compile-commands run	