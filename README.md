# Host & Platform
Host and Platform is a set of modules or module stacks defining
the base operating system, effectively replacing Fedora 26
Boltron Base Runtime module & concept.

The new modules target modular Fedora releases, starting with
version 27.

This main purpose of this repository is being the content tracker
for the new base modules.

## Content definition

This section includes a list of modules along with toplevel
binary input packages for package-level dependency resolution.

### `platform`
Platform defines the base of a Fedora release and a large portion
of its userspace API.  Together with `host` it includes all
the components for baremateal or virtual host installations.
Platform content should be sufficient for container base images.

''Note the lists below are subject to change.''

#### Main Platform packages

* `bash`, base shell
* `btrfs-progs`, Btrfs support
* `bzip2`, base compression support
* `coreutils`, common utilities
* `coreutils-single`, minimized common utilities
* `curl`, a common and versatile utility for fetching remote files
* `dhcp-client`, DHCP client
* `dnf`, DNF package manager
* `docker`, container runtime
* `e2fsprogs`, Ext filesystem support
* `fedora-modular-release`, base system files and macros
* `gawk`, AWK runtime
* `glibc`, C runtime
* `gnupg2`, signature verification
* `gnutls`, common cryptographic library
* `gpgme`, common cryptographic library
* `gzip`, base compression support
* `iproute`, networking support
* `iptables`, networking support
* `iputils`, networking support
* `libgcc`, C runtime
* `libstdc++`, C++ runtime
* `microdnf`, minimized DNF package manager
* `nettle`, common cryptographic library
* `nss`, common cryptographic library
* `openssl`, common cryptographic library
* `rpm`, RPM support
* `rsyslog`, system logging
* `shadow-utils`, common utilities
* `tar`, base compression support
* `util-linux`, common utilities
* `unzip`, base compression support
* `xfsprogs`, XFS support
* `xz`, base compression support

#### Platform-based buildroot packages

* `binutils`, binary utilities
* `byacc`, parser generator
* `fedpkg-minimal`, fetches package sources
* `flex`, lexical generator
* `gcc`, C compiler
* `gcc-c++`, C++ compiler
* `make`, make support
* `m4`, M4 macro processor
* `patch`, patch support
* `redhat-rpm-config`, base RPM macros
* `rpm-build`, RPM build tools

#### Shared userland and other supporting packages

* `c-ares`, a tiny DNS client library
* `fuse-libs`, filesystem in userspace support
* `glib2`, a very commonly used generic utility library
* `gpart`, partitioning support
* `hfsutils`, HFS support
* `libev`, event model library
* `lsscsi`, SCSI listing tools
* `pth`, portable threads library
* `sgml-common`, common SGML catalogs
* `xml-common`, common XML catalogs

### `host`
Host depends on Platform and is bound to it.  The module contains
mainly hardware enablement components and bits tightly linked
to these.  Given its dependency on Platform, deploying the
Host module creates a complete baremetal or virtualized host
operating system.

''Note the lists below are subject to change.''

#### Hardware enablement

* `kernel-bootwrapper`
* `kernel-core`
* `kernel-cross-headers`
* `kernel-headers`
* `kernel-lpae`
* `kernel-modules`
* `kernel-modules-extra`
* `kernel-PAE`
* `kernel-tools`
* `linux-firmware`

#### Bootloaders, architecture specific and tightly coupled packages

* `efibootmgr`
* `fbset`
* `grub2`
* `grub2-efi`
* `grub2-efi-modules`
* `grub2-tools`
* `mactel-boot`
* `memtest86+`
* `ppc64-utils`
* `s390utils-base`
* `s390utils-cmsfs-fuse`
* `shim`, provides the signed binaries, produced by `shim-signed`
* `syslinux`
* `syslinux-extlinux`
* `syslinux-nonlinux`
* `uboot-tools`

### `shim`
The `shim` module includes unsigned `shim` binaries and is
not part of `host` since signing is largely a manual process
and couldn't be part of the modularity automated pipeline.
Signed `shim` binaries are part of the host which builds against
this module.

* `shim-unsigned`, provides the unsigned binaries; this
package is produced by different source packages on different
architectures

### `bootstrap`
This module provides a stable selfhosting buildroot for all of
the abovementioned modules as well as for itself.  Whileits
content is mostly defined as build time dependencies of the
above, it might be used for other special purposes such as
generating the installation media.  For this reason, it might
have a toplevel input package list of its own.

* `anaconda-tui`, used to generate the installation media; this
  is a necessary implementation detail
* `lorax`, used to generate the installation media; this is
  a necessary implementation detail
