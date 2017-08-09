# Host & Platform
Host and Platform is a set of modules or module stacks defining the base
operating system, effectively replacing Fedora 26 Boltron Base Runtime
module & concept.

The new modules target modular Fedora releases, starting with version 27.

This main purpose of this repository is being the content tracker for
the new base modules.

## Content definition

This section includes a list of modules along with toplevel binary input
packages for package-level dependency resolution.

By default we include all subpackages produced by the parent source
package unless doing so would imply inclusion of additional dependencies.
All development subpackages of non-private libraries ought to be included
in `platform`.

### `platform`
Platform defines the base of a Fedora release and a large portion of its
userspace API.  Together with `host` it includes all the components for
baremateal or virtual host installations.  Platform content should be
sufficient for container base images.

Note the lists below are subject to change.

#### Main Platform packages

* `bash`, base shell
* `btrfs-progs`, Btrfs support
* `bzip2`, base compression support
* `coreutils`, common utilities
* `coreutils-single`, minimized common utilities
* `curl`, a common and versatile utility for fetching remote files
* `dhcp-client` (`dhcp`), DHCP client
* `diffutils`, common utilities
* `dnf`, DNF package manager
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
* `libgcc` (`gcc`), C runtime
* `libstdc++` (`gcc`), C++ runtime
* `microdnf`, minimized DNF package manager
* `nano`, basic editor
* `nettle`, common cryptographic library
* `nss`, common cryptographic library
* `openssh-clients` (`openssh`), SSH clients
* `openssh-server` (`openssh`), SSH server
* `openssl`, common cryptographic library
* `procps-ng`, common utilities
* `psmisc`, common utilities
* `rpm`, RPM support
* `rsyslog`, system logging
* `runc` (*aarch64, armv7hl, i686, ppc64le, x86_64, s390x*), minimal
  container runtime
* `sed`, common editor
* `shadow-utils`, common utilities
* `systemd`, the init system
* `sudo`, allows restricted root access
* `tar`, base compression support
* `util-linux`, common utilities
* `unzip`, base compression support
* `xfsprogs`, XFS support
* `xz`, base compression support
* `zstd`, base compression support

#### Platform-based buildroot packages

* `binutils`, binary utilities
* `byacc`, parser generator
* `fedpkg-minimal`, fetches package sources
* `flex`, lexical generator
* `gcc`, C compiler
* `gcc-c++` (`gcc`), C++ compiler
* `make`, make support
* `m4`, M4 macro processor
* `patch`, patch support
* `redhat-rpm-config`, base RPM macros
* `rpm-build` (`rpm`), RPM build tools

#### Shared userland and other supporting packages

* `c-ares`, a tiny DNS client library
* `fuse-libs`, filesystem in userspace support
* `glib2`, a very commonly used generic utility library
* `gpart` (*aarch64, armv7hl, i686, ppc64, ppc64le, x86_64*), partitioning
  support
* `hfsutils`, HFS support
* `libev`, event model library
* `lsscsi`, SCSI listing tools
* `ncurses`, a common TUI interface library and terminfo database
* `pth`, portable threads library
* `tmux`, terminal multiplexer; required by system deployment tools
* `sgml-common`, common SGML catalogs
* `xml-common` (`sgml-common`), common XML catalogs
* `zlib`, a common compression library

### `host`
Host depends on Platform and is bound to it.  The module contains
mainly hardware enablement components and bits tightly linked to these.
Given its dependency on Platform, deploying the Host module creates a
complete baremetal or virtualized host operating system.

Note the lists below are subject to change.

#### Hardware enablement

* `kernel-bootwrapper` (`kernel`; *ppc64, ppc64le*)
* `kernel-core` (`kernel`)
* `kernel-cross-headers` (`kernel`)
* `kernel-headers` (`kernel`)
* `kernel-lpae` (`kernel`; *armv7hl*)
* `kernel-modules` (`kernel`)
* `kernel-modules-extra` (`kernel`)
* `kernel-PAE` (`kernel`; *i686*)
* `kernel-tools` (`kernel`; *aarch64, armv7hl, i686, ppc64, ppc64le, x86_64*)
* `linux-firmware`

#### Bootloaders, architecture specific and tightly coupled packages

* `efibootmgr` (*aarch64, i686, x86_64*)
* `efivar` (*aarch64, i686, x86_64*)
* `fbset` (*aarch64, armv7hl, i686, ppc64, ppc64le, x86_64*)
* `grub2` (*i686, ppc64, ppc64le, x86_64*)
* `grub2-efi` (`grub2`; *aarch64, i686, x86_64*)
* `grub2-efi-modules` (`grub2`; *aarch64, i686, x86_64*)
* `grub2-tools` (`grub2`; *aarch64, i686, ppc64, ppc64le, x86_64*)
* `mactel-boot` (*x86_64*)
* `memtest86+` (*i686, x86_64*)
* `powerpc-utils` (*ppc64, ppc64le*), utilities for PowerPC platforms
* `ppc64-utils` (*ppc64, ppc64le*), utilities for PPC64 platforms
* `s390utils-base` (`s390utils`; *s390x*)
* `s390utils-cmsfs-fuse` (`s390utils`; *s390x*)
* `shim` (`shim-signed`; *aarch64, x86_64*), provides the signed binaries
* `syslinux` (*i686, x86_64*)
* `syslinux-extlinux` (`syslinux`; *i686, x86_64*)
* `syslinux-nonlinux` (`syslinux`; *i686, x86_64*)
* `uboot-tools`

### `shim`
The `shim` module includes unsigned `shim` binaries and is not part of
`host` since signing is largely a manual process and couldn't be part
of the modularity automated pipeline.  Signed `shim` binaries are part
of the host which builds against this module.

* `shim-unsigned` (`shim`, `shim-unsigned-aarch64`; *aarch64, x86_64*),
  provides the unsigned binaries; this package is produced by different
  source packages on different architectures

### `bootstrap`
This module provides a stable selfhosting buildroot for all of the
abovementioned modules as well as for itself.  Whileits content is
mostly defined as build time dependencies of the above, it might be used
for other special purposes such as generating the installation media.
For this reason, it might have a toplevel input package list of its own.

* `anaconda-tui` (`anaconda`), used to generate the installation media;
  this is a necessary implementation detail
* `lorax`, used to generate the installation media; this is a necessary
  implementation detail
