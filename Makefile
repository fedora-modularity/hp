all: atomic bootstrap hp ;

%::
	./mklists.pl -m $@

atomic:

bootstrap:

hp:

hack: atomic bootstrap hp
	find . -name toplevel-binary-packages.txt \
	       -exec sed \
	           -e 's/fedora-modular-release/fedora-release/g' \
	           -e '/coreutils-single/d' \
	           -i {} \;

clean:
	rm -rfv atomic bootstrap hp *.csv
