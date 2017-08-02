all: bootstrap hp

bootstrap:
	./mklists.pl -m bootstrap

hp:
	./mklists.pl -m hp

hack:
	find . -name toplevel-binary-packages.txt \
	       -exec sed \
	           -e 's/fedora-modular-release/fedora-release/g' \
	           -e '/coreutils-single/d' \
	           -i {} \;

clean:
	rm -rfv bootstrap hp *.csv
