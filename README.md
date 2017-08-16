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

**Note: A short-term goal is to make the list of components below more
comprehensive, listing all sub-packages we intend to ship and support
in the documented modules.  Everything else not listed in this document
will be filtered out.  This will make the documentation more useful and
the API and filter definition workflow automatable.  However, this is
not yet the case.  This note will be removed once it is.**

### `platform`
Platform defines the base of a Fedora release and a large portion of its
userspace API.  Together with `host` it includes all the components for
baremateal or virtual host installations.  Platform content should be
sufficient for container base images.

Note the lists below are subject to change.

#### Main Platform packages

* `bash`, base shell
* `bluez`, Bluetooth support, considered hardware-enablement as it's necessary
  for Bluetooth HID
* `btrfs-progs`, Btrfs support
* `bzip2`, base compression support
* `checkpolicy`, provides the SELinux policy compiler
* `cockpit-bridge` (`cockpit`), Cockpit bridge for running commands on
  behalf of the web interface
* `cockpit-system` (`cockpit`), Cockpit shell and system configuration
  interfaces
* `cockpit-ws` (`cockpit`), Cockpit web service for network access and
  user authentication
* `coreutils`, common utilities
* `coreutils-single`, minimized common utilities
* `curl`, a common and versatile utility for fetching remote files
* `dhcp-client` (`dhcp`), DHCP client
* `diffutils`, common utilities
* `dnf`, DNF package manager
* `e2fsprogs`, Ext filesystem support
* `fedora-modular-release`, base system files and macros
* `fipscheck`, provides a library and utilities for integrity verification of
  FIPS-validated modules
* `gawk`, AWK runtime
* `glibc`, C runtime
* `gnupg2`, signature verification
* `gnutls`, common cryptographic library
* `gpgme`, common cryptographic library
* `gzip`, base compression support
* `iproute`, networking support
* `iptables`, networking support
* `iputils`, networking support
* `less`, provides an extremely common pager
* `libgcc` (`gcc`), C runtime
* `libpciaccess`, PCI hardware enablement
* `libstdc++` (`gcc`), C++ runtime
* `libusb`, USB hardware enablement
* `libusbx`, USB hardware enablement
* `libyaml`, YAML support, required for modularity
* `mcstrans`, provides a SELinux translation daemon
* `microdnf`, minimized DNF package manager
* `nano`, basic editor
* `nettle`, common cryptographic library
* `nfs-utils`, NFS support
* `nss`, common cryptographic library
* `openssh-clients` (`openssh`), SSH clients
* `openssh-server` (`openssh`), SSH server
* `openssl`, common cryptographic library
* `parted`, provides the common disk partition manipulation program
* `policycoreutils`, provides utilities for SELinux-enabled system management;
  tools implemented using non-Platform dynamic languages can be found in the
  appropriate Platform extension module
* `procps-ng`, common utilities
* `psmisc`, common utilities
* `rpm`, RPM support
* `rsyslog`, system logging
* `runc` (*aarch64, armv7hl, i686, ppc64le, s390x, x86_64*), minimal
  container runtime
* `sed`, common editor
* `selinux-policy`, provides the base SELinux reference modular policy
* `selinux-policy-minimum`, provides the SELinux minimum policy
* `selinux-policy-mls`, provides the SELinux multi-level security policy
* `selinux-policy-sandbox`, provides the SELinux sandbox policy
* `selinux-policy-targeted`, provides the SELinux targeted policy
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

* `alsa-lib`, the ALSA interface library
* `c-ares`, a tiny DNS client library
* `chrpath`, rpath manipulation, required for bundling binary dependencies
* `compat-openssl10`, OpenSSL 1.0 compatibility package; to be removed once
  nothing in the set requires it
* `dbus-glib`, D-Bus support for GLib packages
* `desktop-file-utils`, a collection of RPM macros and a common build
  dependency
* `docbook-dtds`, Docbook DTDs are a common build dependency
* `docbook-style-xsl`, Docbook XSLs are a common build dependency
* `fuse-libs`, filesystem in userspace support
* `glib2`, a very commonly used generic utility library
* `gpart` (*aarch64, armv7hl, i686, ppc64, ppc64le, x86_64*), partitioning
  support
* `gssproxy`, provides GSSAPI credential handling
* `hfsutils`, HFS support
* `hwdata`, provides PCI, USB and other hardware IDs
* `icu`, tools and utilities for developing with ICU
* `jansson`, provides a JSON library
* `jbigkit`, provides support for PBM and JBIG1 image formats
* `json-c`, provides a JSON library
* `krb5`, provides Kerberos libraries and utilities
* `libcgroup`, required for manipulation, control, administration and
  monitoring of control groups
* `libdaemon`, provides a lightweight library for writing UNIX daemons
* `libedit`, a line-editing library, similar to readline
* `libev`, an event model library
* `libevent`, an event model library
* `libjpeg-turbo`, provides support for JPEG image format
* `libdmodman`, provides a C++ plugin management library
* `libnfsidmap`, provides names and IDs mapper for NFSv4
* `libproxy`, provides a library for proxy configuration management
* `libssh`, implementation of the SSH protocol
* `libssh2`, implementation of the SSH2 protocol
* `libtiff`, provides support for TIFF image format
* `libtirpc`, transport-independent RPC library, required for NFS
* `libunwind`, useful for debugging, providing a C ABI to determine the call
  chain of a program
* `libxslt`, provides an XSLT library and utilities, also a common build
  dependency
* `lksctp-tools`, SCTP interface
* `lsscsi`, SCSI listing tools
* `libsecret`, provides a common password manager and its interface library
* `ncurses`, a common TUI interface library and terminfo database
* `npth`, new portable threads library
* `openjpeg2`, provides support for the JPEG 2000 image format
* `quota`, filesystem quota support, required for NFS
* `readline`, a line-editing library, similar to libedit
* `rpcbind`, universal addresses to RPC program number mapper, required for NFS
* `sgml-common`, common SGML catalogs
* `shared-mime-info`, the shared MIME information database, a generally useful
  data set and a common build dependency
* `tcl`, a common scripting and application integration language
* `tcp_wrappers`, an obsolete yet still commonly required networking filtering
  tools
* `time`, provides a utility for monitoring use of system resources, fallback
  for the shell built-in
* `tmux`, terminal multiplexer; required by system deployment tools
* `xml-common` (`sgml-common`), common XML catalogs
* `xmlrpc-c`, provides a lightweight RPC library
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


### `atomic`
The `atomic` module defines the package set required for running a fully
featured, module-based Atomic Host.  Unlike Host & Platform, the module
is not split into userspace and hardware-enabling parts.  Instead, it's a
well integrated, faster moving module capable of booting on various
configurations, running as an OSTree image and managing containerized
applications.

`atomic` builds against `bootstrap` & `shim` and requires `shim` at
runtime.

* `atomic` (*aarch64, armv7hl, i686, ppc64le, s390x, x86_64*), a tool for
  managing ProjectAtomic systems and containers
* `atomic-devmode` (*aarch64, i686, ppc64le, x86_64*)
* `attr`
* `audit`
* `authconfig`
* `basesystem`
* `bash`
* `bash-completion`
* `bridge-utils`
* `btrfs-progs`
* `bzip2`
* `chrony`
* `cloud-init`
* `cloud-utils-growpart` (`cloud-utils`)
* `cockpit-bridge` (`cockpit`)
* `cockpit-docker` (`cockpit`; *aarch64, armv7hl, i686, ppc64le, s390x, x86_64*)
* `cockpit-networkmanager` (`cockpit`)
* `cockpit-ostree` (`cockpit`)
* `cockpit-system` (`cockpit`)
* `coreutils`
* `cryptsetup`
* `curl`
* `docker` (*aarch64, armv7hl, i686, ppc64le, s390x, x86_64*)
* `dracut-config-generic` (`dracut`)
* `dracut-network` (`dracut`)
* `e2fsprogs`
* `efibootmgr` (*aarch64, i686, x86_64*)
* `extlinux-bootloader` (*aarch64, armv7hl*)
* `fedora-modular-release`
* `glibc`
* `gnupg2`
* `grub2` (*i686, ppc64, ppc64le, x86_64*)
* `grub2-efi` (`grub2`; *aarch64, i686, x86_64*)
* `gzip`
* `hostname`
* `initscripts`
* `iproute`
* `iptables`
* `iptables-services` (`iptables`)
* `iputils`
* `iscsi-initiator-utils`
* `kernel`
* `less`
* `libsss_sudo` (`sssd`)
* `lsof`
* `lvm2`
* `mdadm`
* `NetworkManager`
* `nfs-utils`
* `nmap-ncat` (`nmap`)
* `nss-altfiles`
* `oci-register-machine` (*aarch64, armv7hl, i686, ppc64le, s390x, x86_64*)
* `oci-systemd-hook` (*aarch64, armv7hl, i686, ppc64le, s390x, x86_64*)
* `oddjob-mkhomedir` (`oddjob`)
* `openssh-clients` (`openssh`)
* `openssh-server` (`openssh`)
* `ostree-grub2` (`ostree`; *aarch64, i686, ppc64, ppc64le, x86_64*)
* `passwd`
* `policycoreutils`
* `policycoreutils-python` (`policycoreutils`)
* `policycoreutils-python-utils` (`policycoreutils`)
* `procps-ng`
* `python2`
* `python3`
* `python-docker-py`
* `rootfiles`
* `rpm`
* `rpm-ostree`
* `rsync`
* `runc` (*aarch64, armv7hl, i686, ppc64le, s390x, x86_64*)
* `screen`
* `selinux-policy-targeted` (`selinux-policy`)
* `setools-console` (`setools`)
* `setup`
* `shadow-utils`
* `shim` (`shim-signed`; *aarch64, x86_64*), provides the signed binaries
* `sos`
* `sssd-client` (`sssd`)
* `strace`
* `sudo`
* `systemd`
* `tar`
* `tcpdump`
* `tmux`
* `util-linux`
* `vim-minimal` (`vim`)
* `which`
* `xfsprogs`
* `xz`

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
