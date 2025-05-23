.PHONY: init build

all: init build

init:
	git submodule update --init --recursive

build:
	mkdir -p build && cd build && cmake .. && make

re: clean all

clean:
	rm -rf build

# update external libraries
update:
	git submodule update --remote --merge
