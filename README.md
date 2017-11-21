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
* `bison`, GNU general purpose parser generator
* `bison-devel` (`bison`), allow developers to build against bison
* `bison-runtime` (`bison`), provide runtime environment for applications using
  bison-generated parsers
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
* `dbxtool` (*aarch64, x86_64*), provides DBX updates for securte boot; needed
  for shim
* `dhcp-client` (`dhcp`), DHCP client
* `diffutils`, common utilities
* `dmraid`, provides support for RAID
* `dnf`, DNF package manager
* `dosfstools`, VFAT support
* `e2fsprogs`, Ext filesystem support
* `ebtables`, provides ethernet bridge tools and firewalling
* `ethtool`, provides configuration utilities for ethernet NICs
* `fcoe-utils`, provides support for Fibre Channel over Ethernet configuration
* `fedora-logos`, provides Fedora-related icons and pictures
* `fedora-modular-release`, base system files and macros
* `fipscheck`, provides a library and utilities for integrity verification of
  FIPS-validated modules
* `gawk`, AWK runtime
* `gdisk`, provides a GPT-aware partitioning tool
* `glibc`, C runtime
* `gnupg2`, signature verification
* `gnutls`, common cryptographic library
* `gpgme`, common cryptographic library
* `gzip`, base compression support
* `hfsplus-tools`, HFS/HFS+ support
* `hostname`, provides a utility to view or configure the system hostname
* `initscripts`, provides legacy scripts as well as NIC management tools
* `iproute`, networking support
* `ipset`, provides IP sets management tools
* `iptables`, networking support
* `iputils`, networking support
* `iscsi-initiator-utils`, provides tooling for iSCSI
* `kbd`, provides tools for console and virtual terminal keyboard configuration
* `less`, provides an extremely common pager
* `libgcc` (`gcc`), C runtime
* `libpciaccess`, PCI hardware enablement
* `libstdc++` (`gcc`), C++ runtime
* `libtalloc`, Hierarchical memory allocator
* `libtevent`, Mainloop built atop libtalloc
* `libusb`, USB hardware enablement
* `libusbx`, USB hardware enablement
* `libyaml`, YAML support, required for modularity
* `lldpad`, a link layer discovery daemon with enhanced ethernet support
* `logrotate`, Rotates, compresses, removes and mails system log files
* `man-db`, Tools for searching and reading man pages
* `mcstrans`, provides a SELinux translation daemon
* `mdadm`, provides support for software RAID
* `microdnf`, minimized DNF package manager
* `mokutil` (*aarch64, i686, x86_64*), provides a custom secure boot keys
  management utility; needed for shim
* `nano`, basic editor
* `nettle`, common cryptographic library
* `nfs-utils`, NFS support
* `nss`, common cryptographic library
* `openssh-clients` (`openssh`), SSH clients
* `openssh-server` (`openssh`), SSH server
* `openssl`, common cryptographic library
* `PackageKit`, Package management service
* `parted`, provides the common disk partition manipulation program
* `passwd`, password configuration utility
* `pciutils`, provides PCI bus related utilities
* `policycoreutils`, provides utilities for SELinux-enabled system management;
  tools implemented using non-Platform dynamic languages can be found in the
  appropriate Platform extension module
* `procps-ng`, common utilities
* `psmisc`, common utilities
* `python3`, Python 3
* `python3-devel`, Python 3
* `rootfiles`, basic files for the root's home
* `rpm`, RPM support
* `sed`, common editor
* `selinux-policy`, provides the base SELinux reference modular policy
* `selinux-policy-minimum`, provides the SELinux minimum policy
* `selinux-policy-mls`, provides the SELinux multi-level security policy
* `selinux-policy-sandbox`, provides the SELinux sandbox policy
* `selinux-policy-targeted`, provides the SELinux targeted policy
* `sg3_utils`, utilities for SCSI device management
* `shadow-utils`, common utilities
* `systemd`, the init system
* `sudo`, allows restricted root access
* `tar`, base compression support
* `util-linux`, common utilities
* `unzip`, base compression support
* `words`, A dictionary of English words for the /usr/share/dict directory
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
* `glibc32` (*ppc64, s390x, x86_64*), provides 32-bit headers on 64-bit system
* `make`, make support
* `m4`, M4 macro processor
* `patch`, patch support
* `redhat-rpm-config`, base RPM macros
* `rpm-build` (`rpm`), RPM build tools

#### Shared userland and other supporting packages

* `alsa-lib`, the ALSA interface library
* `augeas`, provides a library for manipulating configuration files
* `bc`, provides a numeric processing language and calculator
* `c-ares`, a tiny DNS client library
* `checksec`, a tool for checking binary hardening
* `chrpath`, rpath manipulation, required for bundling binary dependencies
* `cmake-filesystem` (`cmake`), Cross-platform make system
* `compat-openssl10`, OpenSSL 1.0 compatibility package; to be removed once
  nothing in the set requires it
* `dbus-glib`, D-Bus support for GLib packages
* `desktop-file-utils`, a collection of RPM macros and a common build
  dependency
* `docbook-dtds`, Docbook DTDs are a common build dependency
* `docbook-style-xsl`, Docbook XSLs are a common build dependency
* `dracut`, initramfs generator
* `dracut-caps` (`dracut`), provides tools needed to drop capabilities
* `dracut-config-generic` (`dracut`), provides generic, non-host-specific
  dracut config
* `dracut-config-rescue` (`dracut`), provides generic rescue dracut config
* `dracut-fips` (`dracut`), provides FIPS mode for dracut
* `dracut-network` (`dracut`), provides tools needed to create generic,
  network-enabled dracut images
* `dracut-tools`, (`dracut`), provides tools to create host-based images
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
* `krb5-libs` (`krb5`), provides Kerberos libraries
* `krb5-pkinit` (`krb5`), provides Kerberos PKINIT plugin
* `krb5-workstation` (`krb5`), provides Kerberos client utilities
* `libaio`, provides an asynchronous I/O access library
* `libblockdev`, provides a low-level block device manipulation library,
  necessary for LVM, LUKS or RAID
* `libcgroup`, required for manipulation, control, administration and
  monitoring of control groups
* `libconfig`, a simple library for manipulating structured configuration files
* `libdaemon`, provides a lightweight library for writing UNIX daemons
* `libedit`, a line-editing library, similar to readline
* `libev`, an event model library
* `libevent`, an event model library
* `libjpeg-turbo`, provides support for JPEG image format
* `libmodman`, provides a C++ plugin management library
* `libnfsidmap`, provides names and IDs mapper for NFSv4
* `libnl3`, provides a convenience library for kernel netlink sockets
* `libproxy`, provides a library for proxy configuration management
* `libssh`, implementation of the SSH protocol
* `libssh2`, implementation of the SSH2 protocol
* `libtiff`, provides support for TIFF image format
* `libtirpc`, transport-independent RPC library, required for NFS
* `libunwind` (*aarch64, armv7hl, i686, ppc64, ppc64le, x86_64*), useful
  for debugging, providing a C ABI to determine the call chain of a program
* `libuser`, provides a library for system user and group administration
* `libxslt`, provides an XSLT library and utilities, also a common build
  dependency
* `lksctp-tools`, SCTP interface
* `lsof`, lists open files; a common system management utility
* `lsscsi`, SCSI listing tools
* `libsecret`, provides a common password manager and its interface library
* `multilib-rpm-config`, a collection of tools to simplify multilib packaging
* `ncurses`, a common TUI interface library and terminfo database
* `npth`, new portable threads library
* `openjpeg2`, provides support for the JPEG 2000 image format
* `publicsuffix-list`, provides cross-vendor public domain suffix database
* `publicsuffix-list-dafsa` (`publicsuffix-list`), provides the public suffix
  list database in the DAFSA representation
* `quota`, filesystem quota support, required for NFS
* `readline`, a line-editing library, similar to libedit
* `rpcbind`, universal addresses to RPC program number mapper, required for NFS
* `rsync`, provides a tool for files and directories synchronization
* `sgpio`, provides SGPIO bus support utilities
* `sgml-common`, common SGML catalogs
* `shared-mime-info`, the shared MIME information database, a generally useful
  data set and a common build dependency
* `snappy`, a common compression library
* `tcl`, a common scripting and application integration language
* `tcp_wrappers`, an obsolete yet still commonly required networking filtering
  tools
* `time`, provides a utility for monitoring use of system resources, fallback
  for the shell built-in
* `tmux`, terminal multiplexer; required by system deployment tools
* `usermode`, tools for user account management tasks
* `volume_key`, provides tools for manipulating storage volume encryption keys
* `xml-common` (`sgml-common`), common XML catalogs
* `xmlrpc-c`, provides a lightweight RPC library
* `zlib`, a common compression library

### `host`
Host depends on Platform and is bound to it.  The module contains
mainly hardware enablement components and bits tightly linked to these.
Given its dependency on Platform, deploying the Host module creates a
complete baremetal or virtualized host operating system.

Some of the original `host` packages have been **temporarily** dropped
to resolve Host & Platform dependencies on dynamic language stacks.
These include `kernel-tools`, `ppc64-utils`, `powerpc-utils`,
`s390utils-base` and `s390utils-cmsfs-fuse`.

#### Hardware enablement

* `b43-openfwwf`, open firmware for some B43xx chipsets
* `kernel-bootwrapper` (`kernel`; *ppc64, ppc64le*)
* `kernel-core` (`kernel`)
* `kernel-cross-headers` (`kernel`)
* `kernel-headers` (`kernel`)
* `kernel-lpae` (`kernel`; *armv7hl*)
* `kernel-modules` (`kernel`)
* `kernel-modules-extra` (`kernel`)
* `kernel-PAE` (`kernel`; *i686*)
* `kexec-tools`, provides the kexec utility for booting kernels
* `linux-firmware`

#### Bootloaders, architecture specific and tightly coupled packages

* `efibootmgr` (*aarch64, i686, x86_64*)
* `efivar` (*aarch64, i686, x86_64*)
* `extlinux-bootloader` (*aarch64, armv7hl*)
* `fbset` (*aarch64, armv7hl, i686, ppc64, ppc64le, x86_64*)
* `grub2-common` (`grub2`; *aarch64, i686, ppc64, ppc64le, x86_64*)
* `grub2-efi-aa64` (`grub2`; *aarch64*)
* `grub2-efi-aa64-cdboot` (`grub2`; *aarch64*)
* `grub2-efi-aa64-modules` (`grub2`; *aarch64*)
* `grub2-efi-ia32` (`grub2`; *x86_64*)
* `grub2-efi-ia32-cdboot` (`grub2`; *x86_64*)
* `grub2-efi-ia32-modules` (`grub2`; *x86_64*)
* `grub2-efi-x64` (`grub2`; *x86_64*)
* `grub2-efi-x64-cdboot` (`grub2`; *x86_64*)
* `grub2-efi-x64-modules` (`grub2`; *x86_64*)
* `grub2-pc` (`grub2`; *i686, x86_64*)
* `grub2-pc-modules` (`grub2`; *i686, x86_64*)
* `grub2-ppc64` (`grub2`; *ppc64*)
* `grub2-ppc64-modules` (`grub2`; *ppc64*)
* `grub2-ppc64le` (`grub2`; *ppc64le*)
* `grub2-ppc64le-modules` (`grub2`; *ppc64le*)
* `grub2-tools` (`grub2`; *aarch64, i686, ppc64, ppc64le, x86_64*)
* `grub2-tools-efi` (`grub2`; *x86_64*)
* `grub2-tools-extra` (`grub2`;*aarch64, i686, ppc64, ppc64le, x86_64*)
* `grub2-tools-minimal` (`grub2`; *aarch64, i686, ppc64, ppc64le, x86_64*)
* `mactel-boot` (*x86_64*)
* `plymouth`
* `shim-aa64` (`shim-signed`; *aarch64*), provides the signed aarch64 binaries
* `shim-ia32` (`shim-signed`; *x86_64*), provides the signed i686 binaries
* `shim-x64` (`shim-signed`; *x86_64*), provides the signed x86_64 binaries
* `syslinux` (*i686, x86_64*)
* `syslinux-extlinux` (`syslinux`; *i686, x86_64*)
* `syslinux-nonlinux` (`syslinux`; *i686, x86_64*)
* `uboot-tools`

### `shim`
The `shim` module includes unsigned `shim` binaries and is not part of
`host` since signing is largely a manual process and couldn't be part
of the modularity automated pipeline.  Signed `shim` binaries are part
of the host which builds against this module.

* `shim-unsigned-aarch64` (*aarch64*), provides the unsigned binaries for
  aarch64
* `shim-unsigned-ia32` (`shim-unsigned-x64`; *x86_64*), provides the
  unsigned binaries for i686
* `shim-unsigned-x64` (*x86_64*), provides the unsigned binaries for x86_64


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
* `grub2-common` (`grub2`; *aarch64, i686, ppc64, ppc64le, x86_64*)
* `grub2-efi-aa64` (`grub2`; *aarch64*)
* `grub2-efi-aa64-cdboot` (`grub2`; *aarch64*)
* `grub2-efi-aa64-modules` (`grub2`; *aarch64*)
* `grub2-efi-ia32` (`grub2`; *x86_64*)
* `grub2-efi-ia32-cdboot` (`grub2`; *x86_64*)
* `grub2-efi-ia32-modules` (`grub2`; *x86_64*)
* `grub2-efi-x64` (`grub2`; *x86_64*)
* `grub2-efi-x64-cdboot` (`grub2`; *x86_64*)
* `grub2-efi-x64-modules` (`grub2`; *x86_64*)
* `grub2-pc` (`grub2`; *i686, x86_64*)
* `grub2-pc-modules` (`grub2`; *i686, x86_64*)
* `grub2-ppc64` (`grub2`; *ppc64*)
* `grub2-ppc64-modules` (`grub2`; *ppc64*)
* `grub2-ppc64le` (`grub2`; *ppc64le*)
* `grub2-ppc64le-modules` (`grub2`; *ppc64le*)
* `grub2-tools` (`grub2`; *aarch64, i686, ppc64, ppc64le, x86_64*)
* `grub2-tools-efi` (`grub2`; *x86_64*)
* `grub2-tools-extra` (`grub2`;*aarch64, i686, ppc64, ppc64le, x86_64*)
* `grub2-tools-minimal` (`grub2`; *aarch64, i686, ppc64, ppc64le, x86_64*)
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
* `microcode_ctl` (*i686, x86_64*)
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
* `policycoreutils-python-utils` (`policycoreutils`)
* `procps-ng`
* `python2`
* `python2-policycoreutils` (`policycoreutils`)
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
* `shim-aa64` (`shim-signed`; *aarch64*), provides the signed aarch64 binaries
* `shim-ia32` (`shim-signed`; *x86_64*), provides the signed i686 binaries
* `shim-x64` (`shim-signed`; *x86_64*), provides the signed x86_64 binaries
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

## Required for composes

* `anaconda`, used to generate the installation media;
  this is a necessary implementation detail
* `biosdevname` (*i686, x86_64*), needed to build the `hardware-support`
  module
* `lorax`, used to generate the installation media; this is a necessary
  implementation detail
* `memtest86+` (*i686, x86_64*), needed to build the `hardware-support`
  module
* `powerpc-utils` (*ppc64, ppc64le*), needed to build the `hardware-support`
  module
* `powerpc-utils-core` (`powerpc-utils`; *ppc64, ppc64le*), needed to build the
  `hardware-support` module
* `ppc64-diag` (*ppc64, ppc64le*), needed to build the `hardware-support`
  module
* `ppc64-utils` (*ppc64, ppc64le*), needed to build the `hardware-support`
  module
* `powerpc-utils-core` (`powerpc-utils`; *ppc64, ppc64le*), needed to build the
  `hardware-support` module
* `s390utils` (*s390x*), needed to build the `hardware-support` module
* `strace`, needed for pungi generate installation media

## Additional buildroot packages

* `a2ps`
* `aajohan-comfortaa-fonts`
* `abattis-cantarell-fonts`
* `abrt-addon-ccpp` (`abrt`)
* `abrt-addon-coredump-helper` (`abrt`)
* `abrt-addon-kerneloops` (`abrt`)
* `abrt-addon-pstoreoops` (`abrt`)
* `abrt-addon-upload-watch` (`abrt`)
* `abrt-addon-vmcore` (`abrt`; *armv7hl, i686, ppc64, ppc64le, s390x, x86_64*)
* `abrt-addon-xorg` (`abrt`)
* `abrt-cli-ng` (`abrt`)
* `abrt-cli` (`abrt`)
* `abrt-console-notification` (`abrt`)
* `abrt-dbus` (`abrt`)
* `abrt-desktop` (`abrt`)
* `abrt-devel` (`abrt`)
* `abrt-gui-devel` (`abrt`)
* `abrt-gui-libs` (`abrt`)
* `abrt-gui` (`abrt`)
* `abrt-libs` (`abrt`)
* `abrt-plugin-bodhi` (`abrt`)
* `abrt-plugin-machine-id` (`abrt`)
* `abrt-plugin-sosreport` (`abrt`)
* `abrt-retrace-client` (`abrt`)
* `abrt-tui` (`abrt`)
* `abrt`
* `acl`
* `acpica-tools`
* `acpid` (*aarch64, armv7hl, i686, x86_64*)
* `adcli-doc` (`adcli`)
* `adcli`
* `adobe-source-han-sans-cn-fonts`
* `adobe-source-han-sans-tw-fonts`
* `adobe-source-han-serif-cn-fonts`
* `adobe-source-han-serif-tw-fonts`
* `adwaita-qt-common` (`adwaita-qt`)
* `adwaita-qt4` (`adwaita-qt`)
* `adwaita-qt5` (`adwaita-qt`)
* `adwaita-qt`
* `aide`
* `alacarte`
* `alsa-firmware`
* `alsa-lib-devel` (`alsa-lib`)
* `alsa-lib`
* `alsa-plugins-arcamav` (`alsa-plugins`)
* `alsa-plugins-jack` (`alsa-plugins`)
* `alsa-plugins-maemo` (`alsa-plugins`)
* `alsa-plugins-oss` (`alsa-plugins`)
* `alsa-plugins-pulseaudio` (`alsa-plugins`)
* `alsa-plugins-samplerate` (`alsa-plugins`)
* `alsa-plugins-speex` (`alsa-plugins`)
* `alsa-plugins-upmix` (`alsa-plugins`)
* `alsa-plugins-usbstream` (`alsa-plugins`)
* `alsa-plugins-vdownmix` (`alsa-plugins`)
* `alsa-tools-firmware` (`alsa-tools`)
* `alsa-tools`
* `alsa-ucm` (`alsa-lib`)
* `alsa-utils-alsabat` (`alsa-utils`)
* `alsa-utils`
* `amanda-client` (`amanda`)
* `amanda-libs` (`amanda`)
* `amanda-server` (`amanda`)
* `amanda`
* `anaconda-dracut` (`anaconda`)
* `anaconda-widgets` (`anaconda`)
* `anaconda`
* `ansible-doc` (`ansible`)
* `ansible-python3` (`ansible`)
* `ansible`
* `apr-devel` (`apr`)
* `apr-util-bdb` (`apr-util`)
* `apr-util-devel` (`apr-util`)
* `apr-util-ldap` (`apr-util`)
* `apr-util-mysql` (`apr-util`)
* `apr-util-odbc` (`apr-util`)
* `apr-util-openssl` (`apr-util`)
* `apr-util-pgsql` (`apr-util`)
* `apr-util-sqlite` (`apr-util`)
* `apr-util`
* `apr`
* `arptables`
* `arpwatch`
* `at`
* `atlas-corei2-devel` (`atlas`; *x86_64*)
* `atlas-corei2-static` (`atlas`; *x86_64*)
* `atlas-corei2` (`atlas`; *x86_64*)
* `atlas-devel` (`atlas`)
* `atlas-power7-devel` (`atlas`; *ppc64*)
* `atlas-power7-static` (`atlas`; *ppc64*)
* `atlas-power7` (`atlas`; *ppc64*)
* `atlas-power8-devel` (`atlas`; *ppc64*)
* `atlas-power8-static` (`atlas`; *ppc64*)
* `atlas-power8` (`atlas`; *ppc64*)
* `atlas-static` (`atlas`)
* `atlas-z10-devel` (`atlas`; *s390x*)
* `atlas-z10-static` (`atlas`; *s390x*)
* `atlas-z10` (`atlas`; *s390x*)
* `atlas-z196-devel` (`atlas`; *s390x*)
* `atlas-z196-static` (`atlas`; *s390x*)
* `atlas-z196` (`atlas`; *s390x*)
* `atlas`
* `atmel-firmware`
* `attr`
* `audispd-plugins` (`audit`)
* `audit-libs-python3` (`audit`)
* `audit-libs-python` (`audit`)
* `audit-libs` (`audit`)
* `audit`
* `authselect-libs` (`authselect`)
* `authselect`
* `autofs`
* `avahi-tools` (`avahi`)
* `avahi`
* `b43-openfwwf`
* `bacula-client` (`bacula`)
* `bacula-common` (`bacula`)
* `bacula-console-bat` (`bacula`)
* `bacula-console` (`bacula`)
* `bacula-devel` (`bacula`)
* `bacula-director` (`bacula`)
* `bacula-libs-sql` (`bacula`)
* `bacula-libs` (`bacula`)
* `bacula-logwatch` (`bacula`)
* `bacula-storage` (`bacula`)
* `bacula-traymonitor` (`bacula`)
* `baekmuk-ttf-batang-fonts` (`baekmuk-ttf-fonts`)
* `baekmuk-ttf-dotum-fonts` (`baekmuk-ttf-fonts`)
* `baekmuk-ttf-fonts-common` (`baekmuk-ttf-fonts`)
* `baekmuk-ttf-fonts-ghostscript` (`baekmuk-ttf-fonts`)
* `baekmuk-ttf-gulim-fonts` (`baekmuk-ttf-fonts`)
* `baekmuk-ttf-hline-fonts` (`baekmuk-ttf-fonts`)
* `baobab`
* `bash-completion`
* `bash-doc` (`bash`)
* `bash`
* `bcm283x-firmware` (*aarch64, armv7hl*)
* `bfa-firmware`
* `bind-chroot` (`bind`)
* `bind-dyndb-ldap`
* `bind-pkcs11-utils` (`bind`)
* `bind-pkcs11` (`bind`)
* `bind-sdb-chroot` (`bind`)
* `bind-sdb` (`bind`)
* `bind-utils` (`bind`)
* `bind`
* `biosdevname` (*i686, x86_64*)
* `bitmap-console-fonts` (`bitmap-fonts`)
* `bitmap-fangsongti-fonts` (`bitmap-fonts`)
* `bitmap-fixed-fonts` (`bitmap-fonts`)
* `bitmap-fonts-compat` (`bitmap-fonts`)
* `bitmap-lucida-typewriter-fonts` (`bitmap-fonts`)
* `blas-devel` (`lapack`)
* `blas-static` (`lapack`)
* `blas64-devel` (`lapack`; *aarch64, ppc64, ppc64le, s390x, x86_64*)
* `blas64-static` (`lapack`; *aarch64, ppc64, ppc64le, s390x, x86_64*)
* `blas64` (`lapack`; *aarch64, ppc64, ppc64le, s390x, x86_64*)
* `blas` (`lapack`)
* `blktrace`
* `bltk`
* `bluez-cups` (`bluez`)
* `bluez-hid2hci` (`bluez`)
* `bluez-libs-devel` (`bluez`)
* `bluez-libs` (`bluez`)
* `bluez-obexd` (`bluez`)
* `bluez`
* `booth-arbitrator` (`booth`)
* `booth-core` (`booth`)
* `booth-site` (`booth`)
* `booth-test` (`booth`)
* `booth`
* `bpg-algeti-fonts` (`bpg-fonts`)
* `bpg-chveulebrivi-fonts` (`bpg-fonts`)
* `bpg-classic-fonts` (`bpg-fonts`)
* `bpg-courier-fonts` (`bpg-fonts`)
* `bpg-courier-s-fonts` (`bpg-fonts`)
* `bpg-dedaena-block-fonts` (`bpg-fonts`)
* `bpg-dejavu-sans-fonts` (`bpg-fonts`)
* `bpg-elite-fonts` (`bpg-fonts`)
* `bpg-excelsior-caps-fonts` (`bpg-fonts`)
* `bpg-excelsior-condenced-fonts` (`bpg-fonts`)
* `bpg-excelsior-fonts` (`bpg-fonts`)
* `bpg-fonts-common` (`bpg-fonts`)
* `bpg-glaho-fonts` (`bpg-fonts`)
* `bpg-gorda-fonts` (`bpg-fonts`)
* `bpg-ingiri-fonts` (`bpg-fonts`)
* `bpg-irubaqidze-fonts` (`bpg-fonts`)
* `bpg-mikhail-stephan-fonts` (`bpg-fonts`)
* `bpg-mrgvlovani-caps-fonts` (`bpg-fonts`)
* `bpg-mrgvlovani-fonts` (`bpg-fonts`)
* `bpg-nateli-caps-fonts` (`bpg-fonts`)
* `bpg-nateli-condenced-fonts` (`bpg-fonts`)
* `bpg-nateli-fonts` (`bpg-fonts`)
* `bpg-nino-medium-cond-fonts` (`bpg-fonts`)
* `bpg-nino-medium-fonts` (`bpg-fonts`)
* `bpg-sans-fonts` (`bpg-fonts`)
* `bpg-sans-medium-fonts` (`bpg-fonts`)
* `bpg-sans-modern-fonts` (`bpg-fonts`)
* `bpg-sans-regular-fonts` (`bpg-fonts`)
* `bpg-serif-fonts` (`bpg-fonts`)
* `bpg-serif-modern-fonts` (`bpg-fonts`)
* `bpg-ucnobi-fonts` (`bpg-fonts`)
* `brasero-devel` (`brasero`)
* `brasero-libs` (`brasero`)
* `brasero-nautilus` (`brasero`)
* `brasero`
* `bridge-utils`
* `brlapi-java` (`brltty`)
* `brlapi` (`brltty`)
* `brltty-at-spi2` (`brltty`)
* `brltty-xw` (`brltty`)
* `brltty`
* `btrfs-progs`
* `bzip2`
* `bzr-doc` (`bzr`)
* `bzr`
* `c2esp`
* `ca-certificates`
* `cabal-install`
* `cachefilesd`
* `cassandra-server` (`cassandra`)
* `cassandra`
* `cdrdao` (*aarch64, armv7hl, i686, ppc64, ppc64le, x86_64*)
* `certmonger`
* `cgdcbxd`
* `checkpolicy`
* `chkconfig`
* `chrony`
* `cifs-utils`
* `cjkuni-ukai-fonts`
* `cjkuni-uming-fonts`
* `clevis`
* `cloud-init`
* `clufter-bin` (`clufter`)
* `clufter-cli` (`clufter`)
* `clufter-common` (`clufter`)
* `clufter-lib-ccs` (`clufter`)
* `clufter-lib-general` (`clufter`)
* `clufter-lib-pcs` (`clufter`)
* `clutter-gst2-devel` (`clutter-gst2`)
* `clutter-gst2`
* `cmirror-standalone` (`lvm2`)
* `cmirror` (`lvm2`)
* `cmpi-bindings-pywbem` (`cmpi-bindings`)
* `compat-openssl10`
* `conntrack-tools`
* `convmv`
* `corosync-qdevice` (`corosync`)
* `corosync-qnetd` (`corosync`)
* `corosync`
* `corosynclib-devel` (`corosync`)
* `corosynclib` (`corosync`)
* `cpuid` (*i686, x86_64*)
* `cracklib-dicts` (`cracklib`)
* `crda-devel` (`crda`)
* `crda`
* `createrepo_c-devel` (`createrepo_c`)
* `createrepo_c-libs` (`createrepo_c`)
* `createrepo_c`
* `crit` (`criu`; *aarch64, armv7hl, ppc64le, x86_64*)
* `criu-devel` (`criu`; *aarch64, armv7hl, ppc64le, x86_64*)
* `criu` (*aarch64, armv7hl, ppc64le, x86_64*)
* `cronie-anacron` (`cronie`)
* `cronie-noanacron` (`cronie`)
* `cronie`
* `crontabs`
* `cryptsetup-devel` (`cryptsetup`)
* `cryptsetup-libs` (`cryptsetup`)
* `cryptsetup-python3` (`cryptsetup`)
* `cryptsetup-reencrypt` (`cryptsetup`)
* `cryptsetup`
* `cscope`
* `ctdb-tests` (`samba`)
* `ctdb` (`samba`)
* `culmus-aharoni-clm-fonts` (`culmus-fonts`)
* `culmus-caladings-clm-fonts` (`culmus-fonts`)
* `culmus-david-clm-fonts` (`culmus-fonts`)
* `culmus-drugulin-clm-fonts` (`culmus-fonts`)
* `culmus-ellinia-clm-fonts` (`culmus-fonts`)
* `culmus-fonts-common` (`culmus-fonts`)
* `culmus-frank-ruehl-clm-fonts` (`culmus-fonts`)
* `culmus-hadasim-clm-fonts` (`culmus-fonts`)
* `culmus-keteryg-fonts` (`culmus-fonts`)
* `culmus-miriam-clm-fonts` (`culmus-fonts`)
* `culmus-miriam-mono-clm-fonts` (`culmus-fonts`)
* `culmus-nachlieli-clm-fonts` (`culmus-fonts`)
* `culmus-shofar-fonts` (`culmus-fonts`)
* `culmus-simple-clm-fonts` (`culmus-fonts`)
* `culmus-stamashkenaz-clm-fonts` (`culmus-fonts`)
* `culmus-stamsefarad-clm-fonts` (`culmus-fonts`)
* `culmus-yehuda-clm-fonts` (`culmus-fonts`)
* `cups-filters`
* `cups`
* `curl`
* `custodia`
* `cvs-contrib` (`cvs`)
* `cvs-doc` (`cvs`)
* `cvs-inetd` (`cvs`)
* `cvs`
* `cyrus-imapd`
* `cyrus-sasl-gs2` (`cyrus-sasl`)
* `cyrus-sasl-gssapi` (`cyrus-sasl`)
* `cyrus-sasl-ldap` (`cyrus-sasl`)
* `cyrus-sasl-lib` (`cyrus-sasl`)
* `cyrus-sasl-md5` (`cyrus-sasl`)
* `cyrus-sasl-ntlm` (`cyrus-sasl`)
* `cyrus-sasl-plain` (`cyrus-sasl`)
* `cyrus-sasl-scram` (`cyrus-sasl`)
* `cyrus-sasl-sql` (`cyrus-sasl`)
* `dash`
* `daxctl-devel` (`ndctl`)
* `daxctl-libs` (`ndctl`)
* `daxctl` (`ndctl`)
* `dbus-x11` (`dbus`)
* `dconf-editor`
* `debugmode` (`initscripts`)
* `dejavu-sans-fonts` (`dejavu-fonts`)
* `dejavu-sans-mono-fonts` (`dejavu-fonts`)
* `dejavu-serif-fonts` (`dejavu-fonts`)
* `deltaiso` (`deltarpm`)
* `deltarpm`
* `devhelp-devel` (`devhelp`)
* `devhelp-libs` (`devhelp`)
* `devhelp`
* `device-mapper-devel` (`lvm2`)
* `device-mapper-event-devel` (`lvm2`)
* `device-mapper-event-libs` (`lvm2`)
* `device-mapper-event` (`lvm2`)
* `device-mapper-libs` (`lvm2`)
* `device-mapper-multipath-devel` (`device-mapper-multipath`)
* `device-mapper-multipath-libs` (`device-mapper-multipath`)
* `device-mapper-multipath`
* `device-mapper-persistent-data`
* `device-mapper` (`lvm2`)
* `dhcp-client` (`dhcp`)
* `dhcp-common` (`dhcp`)
* `dhcp-compat` (`dhcp`)
* `dhcp-devel-doc` (`dhcp`)
* `dhcp-devel` (`dhcp`)
* `dhcp-libs` (`dhcp`)
* `dhcp-relay` (`dhcp`)
* `dhcp-server` (`dhcp`)
* `dialog-devel` (`dialog`)
* `dialog`
* `dlm-devel` (`dlm`)
* `dlm-lib` (`dlm`)
* `dlm`
* `dmraid-devel` (`dmraid`)
* `dmraid-events-logwatch` (`dmraid`)
* `dmraid-events` (`dmraid`)
* `dmraid`
* `dnf-automatic` (`dnf`)
* `dnf-conf` (`dnf`)
* `dnf-plugin-subscription-manager` (`subscription-manager`)
* `dnf-plugins-core`
* `dnf-utils` (`dnf-plugins-core`)
* `dnf-yum` (`dnf`)
* `dnf`
* `dnsmasq-utils` (`dnsmasq`)
* `dnsmasq`
* `dnssec-trigger-panel` (`dnssec-trigger`)
* `dnssec-trigger`
* `docker-anaconda-addon` (*aarch64, armv7hl, i686, ppc64le, s390x, x86_64*)
* `docker-distribution` (*aarch64, armv7hl, i686, ppc64le, s390x, x86_64*)
* `docker-latest-devel` (`docker-latest`; *aarch64, armv7hl, i686, ppc64le, s390x, x86_64*)
* `docker-latest-fish-completion` (`docker-latest`; *aarch64, armv7hl, i686, ppc64le, s390x, x86_64*)
* `docker-latest-logrotate` (`docker-latest`; *aarch64, armv7hl, i686, ppc64le, s390x, x86_64*)
* `docker-latest-rhsubscription` (`docker-latest`; *aarch64, armv7hl, i686, ppc64le, s390x, x86_64*)
* `docker-latest-unit-test` (`docker-latest`; *aarch64, armv7hl, i686, ppc64le, s390x, x86_64*)
* `docker-latest-v1.10-migrator` (`docker-latest`; *aarch64, armv7hl, i686, ppc64le, s390x, x86_64*)
* `docker-latest-vim` (`docker-latest`; *aarch64, armv7hl, i686, ppc64le, s390x, x86_64*)
* `docker-latest-zsh-completion` (`docker-latest`; *aarch64, armv7hl, i686, ppc64le, s390x, x86_64*)
* `docker-latest` (*aarch64, armv7hl, i686, ppc64le, s390x, x86_64*)
* `dovecot`
* `dpdk-devel` (`dpdk`; *aarch64, i686, ppc64le, x86_64*)
* `dpdk-doc` (`dpdk`; *aarch64, i686, ppc64le, x86_64*)
* `dpdk-examples` (`dpdk`; *aarch64, i686, ppc64le, x86_64*)
* `dpdk-tools` (`dpdk`; *aarch64, i686, ppc64le, x86_64*)
* `dpdk` (*aarch64, i686, ppc64le, x86_64*)
* `dracut-config-generic` (`dracut`)
* `dracut-fips` (`dracut`)
* `dracut-network` (`dracut`)
* `driverctl`
* `dropwatch`
* `drpmsync` (`deltarpm`)
* `dstat`
* `dump`
* `dvd+rw-tools`
* `e2fsprogs`
* `ebtables`
* `edac-utils-devel` (`edac-utils`; *aarch64, armv7hl, i686, ppc64, ppc64le, x86_64*)
* `edac-utils` (*aarch64, armv7hl, i686, ppc64, ppc64le, x86_64*)
* `efibootmgr` (*aarch64, i686, x86_64*)
* `egl-wayland`
* `ElectricFence`
* `emacs-common` (`emacs`)
* `emacs-filesystem` (`emacs`)
* `emacs-haskell-mode`
* `emacs-lucid` (`emacs`)
* `emacs-nox` (`emacs`)
* `emacs-terminal` (`emacs`)
* `emacs`
* `enchant-voikko` (`enchant`)
* `enscript`
* `environment-modules`
* `eog-devel` (`eog`)
* `eog-tests` (`eog`)
* `eog`
* `erlang-libguestfs` (`libguestfs`)
* `esc` (*armv7hl, i686, ppc64, ppc64le, x86_64*)
* `etcd-devel` (`etcd`; *aarch64, armv7hl, i686, ppc64le, s390x, x86_64*)
* `etcd-unit-test` (`etcd`; *aarch64, armv7hl, i686, ppc64le, s390x, x86_64*)
* `etcd` (*aarch64, armv7hl, i686, ppc64le, s390x, x86_64*)
* `ethtool`
* `evemu-devel` (`evemu`)
* `evemu`
* `evince-browser-plugin` (`evince`)
* `evince-dvi` (`evince`)
* `evince-nautilus` (`evince`)
* `evince`
* `evolution-ews`
* `evolution-mapi`
* `evolution`
* `fabtests`
* `farstream02-devel` (`farstream02`)
* `farstream02`
* `fbset` (*aarch64, armv7hl, i686, ppc64, ppc64le, x86_64*)
* `fcoe-utils`
* `fence-agents-all` (`fence-agents`)
* `fence-agents-alom` (`fence-agents`)
* `fence-agents-amt-ws` (`fence-agents`)
* `fence-agents-amt` (`fence-agents`)
* `fence-agents-apc-snmp` (`fence-agents`)
* `fence-agents-apc` (`fence-agents`)
* `fence-agents-bladecenter` (`fence-agents`)
* `fence-agents-brocade` (`fence-agents`)
* `fence-agents-cisco-mds` (`fence-agents`)
* `fence-agents-cisco-ucs` (`fence-agents`)
* `fence-agents-common` (`fence-agents`)
* `fence-agents-compute` (`fence-agents`)
* `fence-agents-docker` (`fence-agents`)
* `fence-agents-drac5` (`fence-agents`)
* `fence-agents-drac` (`fence-agents`)
* `fence-agents-eaton-snmp` (`fence-agents`)
* `fence-agents-emerson` (`fence-agents`)
* `fence-agents-eps` (`fence-agents`)
* `fence-agents-hds-cb` (`fence-agents`)
* `fence-agents-hpblade` (`fence-agents`)
* `fence-agents-ibmblade` (`fence-agents`)
* `fence-agents-ifmib` (`fence-agents`)
* `fence-agents-ilo-moonshot` (`fence-agents`)
* `fence-agents-ilo-mp` (`fence-agents`)
* `fence-agents-ilo-ssh` (`fence-agents`)
* `fence-agents-ilo2` (`fence-agents`)
* `fence-agents-intelmodular` (`fence-agents`)
* `fence-agents-ipdu` (`fence-agents`)
* `fence-agents-ipmilan` (`fence-agents`)
* `fence-agents-kdump` (`fence-agents`)
* `fence-agents-ldom` (`fence-agents`)
* `fence-agents-lpar` (`fence-agents`)
* `fence-agents-mpath` (`fence-agents`)
* `fence-agents-netio` (`fence-agents`)
* `fence-agents-ovh` (`fence-agents`)
* `fence-agents-pve` (`fence-agents`)
* `fence-agents-raritan` (`fence-agents`)
* `fence-agents-rcd-serial` (`fence-agents`)
* `fence-agents-rhevm` (`fence-agents`)
* `fence-agents-rsa` (`fence-agents`)
* `fence-agents-rsb` (`fence-agents`)
* `fence-agents-sanbox2` (`fence-agents`)
* `fence-agents-sbd` (`fence-agents`)
* `fence-agents-scsi` (`fence-agents`)
* `fence-agents-vbox` (`fence-agents`)
* `fence-agents-virsh` (`fence-agents`)
* `fence-agents-vmware-soap` (`fence-agents`)
* `fence-agents-vmware` (`fence-agents`)
* `fence-agents-wti` (`fence-agents`)
* `fence-agents-xenapi` (`fence-agents`)
* `fence-agents-zvm` (`fence-agents`)
* `fence-sanlock` (`sanlock`)
* `fence-virt`
* `fence-virtd-cpg` (`fence-virt`)
* `fence-virtd-libvirt` (`fence-virt`)
* `fence-virtd-multicast` (`fence-virt`)
* `fence-virtd-serial` (`fence-virt`)
* `fence-virtd-tcp` (`fence-virt`)
* `fence-virtd` (`fence-virt`)
* `festival-devel` (`festival`)
* `festival-docs` (`festival`)
* `festival-lib` (`festival`)
* `festival-speechtools-devel` (`festival`)
* `festival-speechtools-libs` (`festival`)
* `festival-speechtools-utils` (`festival`)
* `festival`
* `festvox-awb-arctic-hts` (`festival`)
* `festvox-bdl-arctic-hts` (`festival`)
* `festvox-clb-arctic-hts` (`festival`)
* `festvox-jmk-arctic-hts` (`festival`)
* `festvox-kal-diphone` (`festival`)
* `festvox-ked-diphone` (`festival`)
* `festvox-rms-arctic-hts` (`festival`)
* `festvox-slt-arctic-hts` (`festival`)
* `fetchmail`
* `file-devel` (`file`)
* `file-libs` (`file`)
* `file-roller-nautilus` (`file-roller`)
* `file-roller`
* `file`
* `finch-devel` (`pidgin`)
* `finch` (`pidgin`)
* `findutils`
* `fio`
* `fipscheck-devel` (`fipscheck`)
* `fipscheck-lib` (`fipscheck`)
* `fipscheck`
* `firefox`
* `firewalld`
* `flannel-devel` (`flannel`; *aarch64, armv7hl, i686, ppc64le, s390x, x86_64*)
* `flannel-unit-test-devel` (`flannel`; *aarch64, armv7hl, i686, ppc64le, s390x, x86_64*)
* `flannel` (*aarch64, armv7hl, i686, ppc64le, s390x, x86_64*)
* `flatpak-builder` (`flatpak`)
* `flatpak-devel` (`flatpak`)
* `flatpak-libs` (`flatpak`)
* `flatpak`
* `fltk-devel` (`fltk`)
* `fltk-fluid` (`fltk`)
* `fltk-static` (`fltk`)
* `fltk`
* `folks-devel` (`folks`)
* `folks-tools` (`folks`)
* `folks`
* `foomatic-db-ppds` (`foomatic-db`)
* `foomatic`
* `fpaste`
* `fprintd-devel` (`fprintd`; *aarch64, armv7hl, i686, ppc64, ppc64le, x86_64*)
* `fprintd-pam` (`fprintd`; *aarch64, armv7hl, i686, ppc64, ppc64le, x86_64*)
* `fprintd` (*aarch64, armv7hl, i686, ppc64, ppc64le, x86_64*)
* `freeipa-client-common` (`freeipa`)
* `freeipa-client` (`freeipa`)
* `freeipa-common` (`freeipa`)
* `freeipa-python-compat` (`freeipa`)
* `freeipa-server-common` (`freeipa`)
* `freeipa-server-dns` (`freeipa`)
* `freeipa-server-trust-ad` (`freeipa`)
* `freeipa-server` (`freeipa`)
* `freeipmi-bmc-watchdog` (`freeipmi`)
* `freeipmi-devel` (`freeipmi`)
* `freeipmi-ipmidetectd` (`freeipmi`)
* `freeipmi-ipmiseld` (`freeipmi`)
* `freeipmi`
* `freeradius`
* `freerdp-devel` (`freerdp`)
* `freerdp-libs` (`freerdp`)
* `freerdp`
* `frei0r-devel` (`frei0r-plugins`)
* `frei0r-plugins-opencv` (`frei0r-plugins`)
* `frei0r-plugins`
* `ftp`
* `fwupd-devel` (`fwupd`)
* `fwupd-labels` (`fwupd`)
* `fwupd-tests` (`fwupd`)
* `fwupd`
* `fwupdate-devel` (`fwupdate`; *aarch64, x86_64*)
* `fwupdate-efi` (`fwupdate`; *aarch64, x86_64*)
* `fwupdate-libs` (`fwupdate`; *aarch64, x86_64*)
* `fwupdate` (*aarch64, x86_64*)
* `fxload`
* `galera`
* `gdb-gdbserver` (`gdb`)
* `gdb`
* `gdisk`
* `gedit-devel` (`gedit`)
* `gedit-plugin-bookmarks` (`gedit-plugins`)
* `gedit-plugin-bracketcompletion` (`gedit-plugins`)
* `gedit-plugin-charmap` (`gedit-plugins`)
* `gedit-plugin-codecomment` (`gedit-plugins`)
* `gedit-plugin-colorpicker` (`gedit-plugins`)
* `gedit-plugin-colorschemer` (`gedit-plugins`)
* `gedit-plugin-commander` (`gedit-plugins`)
* `gedit-plugin-dashboard` (`gedit-plugins`)
* `gedit-plugin-drawspaces` (`gedit-plugins`)
* `gedit-plugin-findinfiles` (`gedit-plugins`)
* `gedit-plugin-git` (`gedit-plugins`)
* `gedit-plugin-joinlines` (`gedit-plugins`)
* `gedit-plugin-multiedit` (`gedit-plugins`)
* `gedit-plugin-smartspaces` (`gedit-plugins`)
* `gedit-plugin-synctex` (`gedit-plugins`)
* `gedit-plugin-terminal` (`gedit-plugins`)
* `gedit-plugin-textsize` (`gedit-plugins`)
* `gedit-plugin-wordcompletion` (`gedit-plugins`)
* `gedit-plugin-zeitgeist` (`gedit-plugins`)
* `gedit-plugins-data` (`gedit-plugins`)
* `gedit-plugins`
* `gedit`
* `genwqe-tools`
* `genwqe-vpd` (`genwqe-tools`)
* `genwqe-zlib-devel` (`genwqe-tools`)
* `genwqe-zlib-static` (`genwqe-tools`)
* `genwqe-zlib` (`genwqe-tools`)
* `gfs2-utils`
* `ghc`
* `glade3-libgladeui-devel` (`glade3`)
* `glade3-libgladeui` (`glade3`)
* `glade3`
* `glibc-all-langpacks` (`glibc`)
* `gmp-c++` (`gmp`)
* `gmp-devel` (`gmp`)
* `gmp-static` (`gmp`)
* `gmp`
* `gnome-abrt`
* `gnome-backgrounds-extras` (`gnome-backgrounds`)
* `gnome-backgrounds`
* `gnome-books` (`gnome-documents`)
* `gnome-boxes`
* `gnome-calculator`
* `gnome-characters`
* `gnome-classic-session` (`gnome-shell-extensions`)
* `gnome-clocks`
* `gnome-color-manager`
* `gnome-contacts`
* `gnome-devel-docs`
* `gnome-disk-utility`
* `gnome-documents-libs` (`gnome-documents`)
* `gnome-documents`
* `gnome-font-viewer`
* `gnome-getting-started-docs-cs` (`gnome-getting-started-docs`)
* `gnome-getting-started-docs-de` (`gnome-getting-started-docs`)
* `gnome-getting-started-docs-es` (`gnome-getting-started-docs`)
* `gnome-getting-started-docs-fr` (`gnome-getting-started-docs`)
* `gnome-getting-started-docs-gl` (`gnome-getting-started-docs`)
* `gnome-getting-started-docs-hu` (`gnome-getting-started-docs`)
* `gnome-getting-started-docs-it` (`gnome-getting-started-docs`)
* `gnome-getting-started-docs-pl` (`gnome-getting-started-docs`)
* `gnome-getting-started-docs-pt_BR` (`gnome-getting-started-docs`)
* `gnome-getting-started-docs-ru` (`gnome-getting-started-docs`)
* `gnome-getting-started-docs`
* `gnome-initial-setup`
* `gnome-logs`
* `gnome-menus-devel` (`gnome-menus`)
* `gnome-menus`
* `gnome-online-miners`
* `gnome-photos-tests` (`gnome-photos`)
* `gnome-photos`
* `gnome-screenshot`
* `gnome-session-wayland-session` (`gnome-session`)
* `gnome-shell-extension-alternate-tab` (`gnome-shell-extensions`)
* `gnome-shell-extension-apps-menu` (`gnome-shell-extensions`)
* `gnome-shell-extension-auto-move-windows` (`gnome-shell-extensions`)
* `gnome-shell-extension-common` (`gnome-shell-extensions`)
* `gnome-shell-extension-drive-menu` (`gnome-shell-extensions`)
* `gnome-shell-extension-launch-new-instance` (`gnome-shell-extensions`)
* `gnome-shell-extension-native-window-placement` (`gnome-shell-extensions`)
* `gnome-shell-extension-places-menu` (`gnome-shell-extensions`)
* `gnome-shell-extension-screenshot-window-sizer` (`gnome-shell-extensions`)
* `gnome-shell-extension-user-theme` (`gnome-shell-extensions`)
* `gnome-shell-extension-window-list` (`gnome-shell-extensions`)
* `gnome-shell-extension-windowsNavigator` (`gnome-shell-extensions`)
* `gnome-shell-extension-workspace-indicator` (`gnome-shell-extensions`)
* `gnome-software-devel` (`gnome-software`)
* `gnome-software-editor` (`gnome-software`)
* `gnome-software-snap` (`gnome-software`)
* `gnome-software`
* `gnome-system-monitor`
* `gnome-terminal-nautilus` (`gnome-terminal`)
* `gnome-terminal`
* `gnome-tweak-tool`
* `gnome-user-docs`
* `gnome-video-effects`
* `gnome-weather-tests` (`gnome-weather`)
* `gnome-weather`
* `gnu-free-mono-fonts` (`gnu-free-fonts`)
* `gnu-free-sans-fonts` (`gnu-free-fonts`)
* `gnu-free-serif-fonts` (`gnu-free-fonts`)
* `gnupg2-smime` (`gnupg2`)
* `gnupg2`
* `gnutls-dane` (`gnutls`)
* `gnutls-devel` (`gnutls`)
* `gnutls-utils` (`gnutls`)
* `gnutls`
* `google-crosextra-caladea-fonts`
* `google-crosextra-carlito-fonts`
* `google-noto-cjk-fonts`
* `google-noto-emoji-fonts`
* `google-noto-sans-lisu-fonts` (`google-noto-fonts`)
* `google-noto-sans-mandaic-fonts` (`google-noto-fonts`)
* `google-noto-sans-meetei-mayek-fonts` (`google-noto-fonts`)
* `google-noto-sans-tagalog-fonts` (`google-noto-fonts`)
* `google-noto-sans-tai-tham-fonts` (`google-noto-fonts`)
* `google-noto-sans-tai-viet-fonts` (`google-noto-fonts`)
* `gpart` (*aarch64, armv7hl, i686, ppc64, ppc64le, x86_64*)
* `gperftools-devel` (`gperftools`)
* `gperftools-libs` (`gperftools`)
* `gperftools`
* `grep`
* `grilo-plugins`
* `grub2-efi-aa64-cdboot` (`grub2`; *aarch64*)
* `grub2-efi-ia32-cdboot` (`grub2`; *x86_64*)
* `grub2-efi-x64-cdboot` (`grub2`; *x86_64*)
* `grub2-ppc64` (`grub2`; *ppc64*)
* `grub2-ppc64le` (`grub2`; *ppc64le*)
* `grub2-tools-efi` (`grub2`; *x86_64*)
* `grub2-tools-extra` (`grub2`; *aarch64, i686, ppc64, ppc64le, x86_64*)
* `grub2-tools-minimal` (`grub2`; *aarch64, i686, ppc64, ppc64le, x86_64*)
* `grub2-tools` (`grub2`; *aarch64, i686, ppc64, ppc64le, x86_64*)
* `grubby`
* `gsettings-desktop-schemas`
* `gsound-devel` (`gsound`)
* `gsound`
* `gssproxy`
* `gstreamer1-plugins-ugly-free-devel` (`gstreamer1-plugins-ugly-free`)
* `gstreamer1-plugins-ugly-free`
* `gtk2-immodule-xim` (`gtk2`)
* `gtk3-immodule-xim` (`gtk3`)
* `gubbi-fonts`
* `gucharmap-devel` (`gucharmap`)
* `gucharmap-libs` (`gucharmap`)
* `gucharmap`
* `gutenprint-cups` (`gutenprint`)
* `gutenprint-doc` (`gutenprint`)
* `gxvattr` (`xvattr`)
* `haproxy`
* `haskell-platform`
* `hdparm`
* `heat-cfntools`
* `hexchat-devel` (`hexchat`)
* `hexchat`
* `hexedit`
* `hfsutils`
* `highcontrast-qt4` (`highcontrast-qt`)
* `highcontrast-qt5` (`highcontrast-qt`)
* `highcontrast-qt`
* `hispavoces-pal-diphone` (`festival`)
* `hispavoces-sfl-diphone` (`festival`)
* `hivex-devel` (`hivex`)
* `hivex-static` (`hivex`)
* `hivex`
* `hlint`
* `hplip-gui` (`hplip`)
* `hplip`
* `hsakmt-devel` (`hsakmt`; *aarch64, ppc64, ppc64le, s390x, x86_64*)
* `hsakmt` (*aarch64, ppc64, ppc64le, s390x, x86_64*)
* `httpd-devel` (`httpd`)
* `httpd-filesystem` (`httpd`)
* `httpd-manual` (`httpd`)
* `httpd-tools` (`httpd`)
* `httpd`
* `hunspell-af`
* `hunspell-ak`
* `hunspell-am`
* `hunspell-ar`
* `hunspell-as`
* `hunspell-ast`
* `hunspell-az`
* `hunspell-be`
* `hunspell-ber`
* `hunspell-bg`
* `hunspell-bn`
* `hunspell-br`
* `hunspell-ca`
* `hunspell-cop`
* `hunspell-csb`
* `hunspell-cv`
* `hunspell-cy`
* `hunspell-da`
* `hunspell-de`
* `hunspell-dsb`
* `hunspell-el`
* `hunspell-en`
* `hunspell-eo`
* `hunspell-es`
* `hunspell-et`
* `hunspell-eu`
* `hunspell-fa`
* `hunspell-fj`
* `hunspell-fo`
* `hunspell-fr`
* `hunspell-fur`
* `hunspell-fy`
* `hunspell-ga`
* `hunspell-gd`
* `hunspell-gl`
* `hunspell-grc`
* `hunspell-gu`
* `hunspell-gv`
* `hunspell-haw`
* `hunspell-hi`
* `hunspell-hil`
* `hunspell-hr`
* `hunspell-hsb`
* `hunspell-ht`
* `hunspell-hu`
* `hunspell-hy`
* `hunspell-ia`
* `hunspell-id`
* `hunspell-is`
* `hunspell-it`
* `hunspell-kk`
* `hunspell-km`
* `hunspell-kn`
* `hunspell-ko`
* `hunspell-ku`
* `hunspell-ky`
* `hunspell-la`
* `hunspell-lb`
* `hunspell-ln`
* `hunspell-lt`
* `hunspell-lv` (`openoffice-lv`)
* `hunspell-mai`
* `hunspell-mg`
* `hunspell-mi`
* `hunspell-mk`
* `hunspell-ml`
* `hunspell-mn`
* `hunspell-mos`
* `hunspell-mr`
* `hunspell-ms`
* `hunspell-mt`
* `hunspell-nb` (`hunspell-no`)
* `hunspell-nds`
* `hunspell-ne`
* `hunspell-nl`
* `hunspell-nn` (`hunspell-no`)
* `hunspell-nr`
* `hunspell-nso`
* `hunspell-ny`
* `hunspell-oc`
* `hunspell-om`
* `hunspell-or`
* `hunspell-pa`
* `hunspell-pl`
* `hunspell-pt`
* `hunspell-qu`
* `hunspell-quh`
* `hunspell-ro`
* `hunspell-ru`
* `hunspell-rw`
* `hunspell-sc`
* `hunspell-se`
* `hunspell-shs`
* `hunspell-si`
* `hunspell-sk`
* `hunspell-sl`
* `hunspell-smj`
* `hunspell-so`
* `hunspell-sq`
* `hunspell-sr`
* `hunspell-ss`
* `hunspell-st`
* `hunspell-sv`
* `hunspell-sw`
* `hunspell-ta`
* `hunspell-te`
* `hunspell-tet`
* `hunspell-th`
* `hunspell-ti`
* `hunspell-tk`
* `hunspell-tl`
* `hunspell-tn`
* `hunspell-tpi`
* `hunspell-ts`
* `hunspell-uk`
* `hunspell-ur`
* `hunspell-uz`
* `hunspell-ve`
* `hunspell-vi`
* `hunspell-wa`
* `hunspell-xh`
* `hunspell-yi`
* `hunspell-zu`
* `hwloc-devel` (`hwloc`)
* `hwloc-gui` (`hwloc`)
* `hwloc-libs` (`hwloc`)
* `hwloc-plugins` (`hwloc`)
* `hwloc`
* `hyperv-daemons-license` (`hyperv-daemons`; *i686, x86_64*)
* `hyperv-daemons` (*i686, x86_64*)
* `hyperv-tools` (`hyperv-daemons`; *i686, x86_64*)
* `hypervfcopyd` (`hyperv-daemons`; *i686, x86_64*)
* `hypervkvpd` (`hyperv-daemons`; *i686, x86_64*)
* `hypervvssd` (`hyperv-daemons`; *i686, x86_64*)
* `hyphen-af` (`zaf`)
* `hyphen-as`
* `hyphen-bg`
* `hyphen-bn`
* `hyphen-ca`
* `hyphen-cy`
* `hyphen-da`
* `hyphen-de`
* `hyphen-el`
* `hyphen-es`
* `hyphen-eu`
* `hyphen-fa`
* `hyphen-fo`
* `hyphen-fr`
* `hyphen-ga`
* `hyphen-gl`
* `hyphen-grc`
* `hyphen-gu`
* `hyphen-hi`
* `hyphen-hsb`
* `hyphen-hu`
* `hyphen-ia`
* `hyphen-id`
* `hyphen-is`
* `hyphen-it`
* `hyphen-kn`
* `hyphen-ku`
* `hyphen-lt`
* `hyphen-lv` (`openoffice-lv`)
* `hyphen-mi`
* `hyphen-ml`
* `hyphen-mn`
* `hyphen-mr`
* `hyphen-nb` (`hunspell-no`)
* `hyphen-nl`
* `hyphen-nn` (`hunspell-no`)
* `hyphen-or`
* `hyphen-pa`
* `hyphen-pl`
* `hyphen-pt`
* `hyphen-ro`
* `hyphen-ru`
* `hyphen-sa`
* `hyphen-sk`
* `hyphen-sl`
* `hyphen-sv`
* `hyphen-ta`
* `hyphen-te`
* `hyphen-tk`
* `hyphen-uk`
* `hyphen-zu` (`zaf`)
* `i2c-tools-eepromer` (`i2c-tools`; *aarch64, armv7hl, i686, ppc64, ppc64le, x86_64*)
* `i2c-tools-perl` (`i2c-tools`; *aarch64, armv7hl, i686, ppc64, ppc64le, x86_64*)
* `i2c-tools` (*aarch64, armv7hl, i686, ppc64, ppc64le, x86_64*)
* `ibacm` (`rdma-core`; *aarch64, i686, ppc64, ppc64le, s390x, x86_64*)
* `ibus-gtk2` (`ibus`)
* `ibus-gtk3` (`ibus`)
* `ibus-hangul`
* `ibus-kkc`
* `ibus-libpinyin`
* `ibus-libzhuyin`
* `ibus-m17n`
* `ibus-qt`
* `ibus-rawcode`
* `ibus-sayura`
* `ibus-table-chinese-array` (`ibus-table-chinese`)
* `ibus-table-chinese-cangjie` (`ibus-table-chinese`)
* `ibus-table-chinese-cantonese` (`ibus-table-chinese`)
* `ibus-table-chinese-easy` (`ibus-table-chinese`)
* `ibus-table-chinese-erbi` (`ibus-table-chinese`)
* `ibus-table-chinese-quick` (`ibus-table-chinese`)
* `ibus-table-chinese-scj` (`ibus-table-chinese`)
* `ibus-table-chinese-stroke5` (`ibus-table-chinese`)
* `ibus-table-chinese-wu` (`ibus-table-chinese`)
* `ibus-table-chinese-wubi-haifeng` (`ibus-table-chinese`)
* `ibus-table-chinese-wubi-jidian` (`ibus-table-chinese`)
* `ibus-table-chinese-yong` (`ibus-table-chinese`)
* `ibus-table-chinese`
* `ibus-table`
* `ibus-typing-booster`
* `ibus-wayland` (`ibus`)
* `ibus`
* `ibutils-devel` (`ibutils`; *aarch64, i686, ppc64, ppc64le, x86_64*)
* `ibutils-libs` (`ibutils`; *aarch64, i686, ppc64, ppc64le, x86_64*)
* `ibutils-static` (`ibutils`; *aarch64, i686, ppc64, ppc64le, x86_64*)
* `ibutils` (*aarch64, i686, ppc64, ppc64le, x86_64*)
* `icedtea-web-devel` (`icedtea-web`)
* `icedtea-web-javadoc` (`icedtea-web`)
* `icedtea-web`
* `icfg`
* `infinipath-psm-devel` (`infinipath-psm`; *x86_64*)
* `infinipath-psm` (*x86_64*)
* `initial-setup-gui` (`initial-setup`)
* `initial-setup`
* `initscripts`
* `inkscape`
* `intel-gpu-tools` (`xorg-x11-drv-intel`; *i686, x86_64*)
* `iotop`
* `iowatcher` (`blktrace`)
* `ipa-gothic-fonts`
* `ipa-mincho-fonts`
* `ipa-pgothic-fonts`
* `ipa-pmincho-fonts`
* `iperf3`
* `ipmitool`
* `iproute-devel` (`iproute`)
* `iproute-doc` (`iproute`)
* `iproute-tc` (`iproute`)
* `iproute`
* `iprutils`
* `iptables-compat` (`iptables`)
* `iptables-devel` (`iptables`)
* `iptables-libs` (`iptables`)
* `iptables-services` (`iptables`)
* `iptables-utils` (`iptables`)
* `iptables`
* `iptraf-ng`
* `iptstate`
* `iputils`
* `ipvsadm`
* `ipw2100-firmware`
* `ipw2200-firmware`
* `ipxe-bootimgs` (`ipxe`)
* `ipxe-roms-qemu` (`ipxe`)
* `ipxe-roms` (`ipxe`)
* `irqbalance` (*aarch64, armv7hl, i686, ppc64, ppc64le, x86_64*)
* `irssi`
* `iscsi-initiator-utils-devel` (`iscsi-initiator-utils`)
* `iscsi-initiator-utils-iscsiuio` (`iscsi-initiator-utils`)
* `iscsi-initiator-utils`
* `isns-utils-devel` (`isns-utils`)
* `isns-utils-libs` (`isns-utils`)
* `isns-utils`
* `ivshmem-tools` (`qemu`)
* `iwl100-firmware` (`linux-firmware`)
* `iwl1000-firmware` (`linux-firmware`)
* `iwl105-firmware` (`linux-firmware`)
* `iwl135-firmware` (`linux-firmware`)
* `iwl2000-firmware` (`linux-firmware`)
* `iwl2030-firmware` (`linux-firmware`)
* `iwl3160-firmware` (`linux-firmware`)
* `iwl3945-firmware` (`linux-firmware`)
* `iwl4965-firmware` (`linux-firmware`)
* `iwl5000-firmware` (`linux-firmware`)
* `iwl5150-firmware` (`linux-firmware`)
* `iwl6000-firmware` (`linux-firmware`)
* `iwl6000g2a-firmware` (`linux-firmware`)
* `iwl6000g2b-firmware` (`linux-firmware`)
* `iwl6050-firmware` (`linux-firmware`)
* `iwl7260-firmware` (`linux-firmware`)
* `iwpmd` (`rdma-core`; *aarch64, i686, ppc64, ppc64le, s390x, x86_64*)
* `ixpdimm-cli` (`ixpdimm_sw`; *x86_64*)
* `ixpdimm-monitor` (`ixpdimm_sw`; *x86_64*)
* `ixpdimm_sw-devel` (`ixpdimm_sw`; *x86_64*)
* `ixpdimm_sw` (*x86_64*)
* `jansson-devel-doc` (`jansson`)
* `jansson-devel` (`jansson`)
* `jansson`
* `jbigkit`
* `jfsutils`
* `jomolhari-fonts`
* `jose`
* `julietaula-montserrat-fonts`
* `kacst-art-fonts` (`kacst-fonts`)
* `kacst-book-fonts` (`kacst-fonts`)
* `kacst-decorative-fonts` (`kacst-fonts`)
* `kacst-digital-fonts` (`kacst-fonts`)
* `kacst-farsi-fonts` (`kacst-fonts`)
* `kacst-fonts-common` (`kacst-fonts`)
* `kacst-letter-fonts` (`kacst-fonts`)
* `kacst-naskh-fonts` (`kacst-fonts`)
* `kacst-office-fonts` (`kacst-fonts`)
* `kacst-one-fonts` (`kacst-fonts`)
* `kacst-pen-fonts` (`kacst-fonts`)
* `kacst-poster-fonts` (`kacst-fonts`)
* `kacst-qurn-fonts` (`kacst-fonts`)
* `kacst-screen-fonts` (`kacst-fonts`)
* `kacst-title-fonts` (`kacst-fonts`)
* `kacst-titlel-fonts` (`kacst-fonts`)
* `kbd-misc` (`kbd`)
* `kbd`
* `keepalived`
* `kernel-bootwrapper` (`kernel`; *ppc64, ppc64le*)
* `kernel-lpae` (`kernel`; *armv7hl*)
* `kernel-modules-extra` (`kernel`)
* `kernel-modules` (`kernel`)
* `kernel-PAE` (`kernel`; *i686*)
* `kernel`
* `kernelshark` (`trace-cmd`)
* `kexec-tools-anaconda-addon` (`kexec-tools`)
* `keycloak-httpd-client-install`
* `keyutils`
* `khmeros-base-fonts` (`khmeros-fonts`)
* `kpartx` (`device-mapper-multipath`)
* `krb5-devel` (`krb5`)
* `krb5-libs` (`krb5`)
* `krb5-pkinit` (`krb5`)
* `krb5-server-ldap` (`krb5`)
* `krb5-server` (`krb5`)
* `krb5-workstation` (`krb5`)
* `ksh`
* `ksm` (`qemu`)
* `kubernetes-client` (`kubernetes`; *aarch64, ppc64le, s390x, x86_64*)
* `kubernetes-devel` (`kubernetes`; *aarch64, ppc64le, s390x, x86_64*)
* `kubernetes-kubeadm` (`kubernetes`; *aarch64, ppc64le, s390x, x86_64*)
* `kubernetes-master` (`kubernetes`; *aarch64, ppc64le, s390x, x86_64*)
* `kubernetes-node` (`kubernetes`; *aarch64, ppc64le, s390x, x86_64*)
* `kubernetes-unit-test` (`kubernetes`; *aarch64, ppc64le, s390x, x86_64*)
* `kubernetes` (*aarch64, ppc64le, s390x, x86_64*)
* `kurdit-unikurd-web-fonts`
* `lapack-devel` (`lapack`)
* `lapack-static` (`lapack`)
* `lapack64-devel` (`lapack`; *aarch64, ppc64, ppc64le, s390x, x86_64*)
* `lapack64-static` (`lapack`; *aarch64, ppc64, ppc64le, s390x, x86_64*)
* `lapack64` (`lapack`; *aarch64, ppc64, ppc64le, s390x, x86_64*)
* `lapack`
* `ldirectord` (`resource-agents`)
* `ledmon`
* `less`
* `lftp`
* `libacl-devel` (`acl`)
* `libacl` (`acl`)
* `libaio-devel` (`libaio`)
* `libaio`
* `libattr-devel` (`attr`)
* `libattr` (`attr`)
* `libblkid-devel` (`util-linux`)
* `libblkid` (`util-linux`)
* `libblockdev-lvm-dbus` (`libblockdev`)
* `libcomps-devel` (`libcomps`)
* `libcomps-doc` (`libcomps`)
* `libcomps`
* `libcxl-devel` (`libcxl`; *ppc64, ppc64le*)
* `libcxl` (*ppc64, ppc64le*)
* `libdbi-drivers`
* `libdbi`
* `libdfu-devel` (`fwupd`)
* `libdfu` (`fwupd`)
* `libdmmp-devel` (`device-mapper-multipath`)
* `libdmmp` (`device-mapper-multipath`)
* `libdnf-devel` (`libdnf`)
* `libdnf`
* `liberation-mono-fonts` (`liberation-fonts`)
* `liberation-sans-fonts` (`liberation-fonts`)
* `liberation-serif-fonts` (`liberation-fonts`)
* `libertas-sd8686-firmware` (`linux-firmware`)
* `libertas-sd8787-firmware` (`linux-firmware`)
* `libertas-usb8388-firmware` (`linux-firmware`)
* `libertas-usb8388-olpc-firmware` (`linux-firmware`)
* `libfabric`
* `libfdisk-devel` (`util-linux`)
* `libfdisk` (`util-linux`)
* `libgcrypt-devel` (`libgcrypt`)
* `libgcrypt`
* `libgovirt-devel` (`libgovirt`)
* `libgovirt`
* `libguestfs-bash-completion` (`libguestfs`)
* `libguestfs-benchmarking` (`libguestfs`; *aarch64, x86_64*)
* `libguestfs-devel` (`libguestfs`)
* `libguestfs-forensics` (`libguestfs`)
* `libguestfs-gfs2` (`libguestfs`)
* `libguestfs-gobject-devel` (`libguestfs`)
* `libguestfs-gobject` (`libguestfs`)
* `libguestfs-hfsplus` (`libguestfs`)
* `libguestfs-inspect-icons` (`libguestfs`)
* `libguestfs-java-devel` (`libguestfs`)
* `libguestfs-java` (`libguestfs`)
* `libguestfs-javadoc` (`libguestfs`)
* `libguestfs-jfs` (`libguestfs`)
* `libguestfs-man-pages-ja` (`libguestfs`)
* `libguestfs-man-pages-uk` (`libguestfs`)
* `libguestfs-nilfs` (`libguestfs`)
* `libguestfs-reiserfs` (`libguestfs`)
* `libguestfs-rescue` (`libguestfs`)
* `libguestfs-rsync` (`libguestfs`)
* `libguestfs-tools-c` (`libguestfs`)
* `libguestfs-tools` (`libguestfs`)
* `libguestfs-xfs` (`libguestfs`)
* `libguestfs-zfs` (`libguestfs`; *i686, ppc64, ppc64le, x86_64*)
* `libguestfs`
* `libhbaapi-devel` (`libhbaapi`)
* `libhbaapi`
* `libhbalinux-devel` (`libhbalinux`)
* `libhbalinux`
* `libhugetlbfs-devel` (`libhugetlbfs`)
* `libhugetlbfs-utils` (`libhugetlbfs`)
* `libhugetlbfs`
* `libibcm` (`rdma-core`; *aarch64, i686, ppc64, ppc64le, s390x, x86_64*)
* `libibumad` (`rdma-core`; *aarch64, i686, ppc64, ppc64le, s390x, x86_64*)
* `libibverbs-utils` (`rdma-core`; *aarch64, i686, ppc64, ppc64le, s390x, x86_64*)
* `libibverbs` (`rdma-core`; *aarch64, i686, ppc64, ppc64le, s390x, x86_64*)
* `libica-devel` (`libica`; *s390x*)
* `libica` (*s390x*)
* `libinvm-cim-devel` (`libinvm-cim`; *x86_64*)
* `libinvm-cim` (*x86_64*)
* `libinvm-cli-devel` (`libinvm-cli`; *x86_64*)
* `libinvm-cli` (*x86_64*)
* `libinvm-i18n-devel` (`libinvm-i18n`; *x86_64*)
* `libinvm-i18n` (*x86_64*)
* `libipa_hbac-devel` (`sssd`)
* `libipa_hbac` (`sssd`)
* `libixpdimm-cim` (`ixpdimm_sw`; *x86_64*)
* `libixpdimm-core` (`ixpdimm_sw`; *x86_64*)
* `libkadm5` (`krb5`)
* `libkeepalive`
* `libmalaga` (`malaga`)
* `libmbim-utils` (`libmbim`)
* `libmbim`
* `libmount-devel` (`util-linux`)
* `libmount` (`util-linux`)
* `libndp-devel` (`libndp`)
* `libndp`
* `libnetfilter_conntrack-devel` (`libnetfilter_conntrack`)
* `libnetfilter_conntrack`
* `libnetfilter_queue-devel` (`libnetfilter_queue`)
* `libnetfilter_queue`
* `libnfsidmap`
* `libnftnl`
* `libnl3`
* `libnsl2`
* `libpaper`
* `libpcap`
* `libpmem-debug` (`nvml`; *x86_64*)
* `libpmem-devel` (`nvml`; *x86_64*)
* `libpmem` (`nvml`; *x86_64*)
* `libpmemblk-debug` (`nvml`; *x86_64*)
* `libpmemblk-devel` (`nvml`; *x86_64*)
* `libpmemblk` (`nvml`; *x86_64*)
* `libpmemlog-debug` (`nvml`; *x86_64*)
* `libpmemlog-devel` (`nvml`; *x86_64*)
* `libpmemlog` (`nvml`; *x86_64*)
* `libpmemobj++-devel` (`nvml`; *x86_64*)
* `libpmemobj-debug` (`nvml`; *x86_64*)
* `libpmemobj-devel` (`nvml`; *x86_64*)
* `libpmemobj` (`nvml`; *x86_64*)
* `libpmempool-debug` (`nvml`; *x86_64*)
* `libpmempool-devel` (`nvml`; *x86_64*)
* `libpmempool` (`nvml`; *x86_64*)
* `libpsm2-devel` (`libpsm2`; *x86_64*)
* `libpsm2` (*x86_64*)
* `libpurple-devel` (`pidgin`)
* `libpurple-perl` (`pidgin`)
* `libpurple-tcl` (`pidgin`)
* `libpurple` (`pidgin`)
* `libpwquality-devel` (`libpwquality`)
* `libpwquality`
* `libqb-devel` (`libqb`)
* `libqb`
* `libqmi-utils` (`libqmi`)
* `libqmi`
* `librdmacm-utils` (`rdma-core`; *aarch64, i686, ppc64, ppc64le, s390x, x86_64*)
* `librdmacm` (`rdma-core`; *aarch64, i686, ppc64, ppc64le, s390x, x86_64*)
* `libreoffice-base` (`libreoffice`)
* `libreoffice-calc` (`libreoffice`)
* `libreoffice-core` (`libreoffice`)
* `libreoffice-draw` (`libreoffice`)
* `libreoffice-emailmerge` (`libreoffice`)
* `libreoffice-filters` (`libreoffice`)
* `libreoffice-glade` (`libreoffice`)
* `libreoffice-graphicfilter` (`libreoffice`)
* `libreoffice-gtk2` (`libreoffice`)
* `libreoffice-gtk3` (`libreoffice`)
* `libreoffice-impress` (`libreoffice`)
* `libreoffice-math` (`libreoffice`)
* `libreoffice-nlpsolver` (`libreoffice`)
* `libreoffice-officebean` (`libreoffice`)
* `libreoffice-ogltrans` (`libreoffice`)
* `libreoffice-pdfimport` (`libreoffice`)
* `libreoffice-postgresql` (`libreoffice`)
* `libreoffice-pyuno` (`libreoffice`)
* `libreoffice-sdk` (`libreoffice`)
* `libreoffice-wiki-publisher` (`libreoffice`)
* `libreoffice-writer` (`libreoffice`)
* `libreoffice-xsltfilter` (`libreoffice`)
* `libreoffice`
* `libreofficekit` (`libreoffice`)
* `librepo-devel` (`librepo`)
* `librepo`
* `libreport-plugin-bugzilla` (`libreport`)
* `libreport-plugin-reportuploader` (`libreport`)
* `libreswan`
* `librpmem-debug` (`nvml`; *x86_64*)
* `librpmem-devel` (`nvml`; *x86_64*)
* `librpmem` (`nvml`; *x86_64*)
* `librsvg2`
* `librtas-devel` (`librtas`; *ppc64, ppc64le*)
* `librtas` (*ppc64, ppc64le*)
* `libseccomp-devel` (`libseccomp`)
* `libseccomp-static` (`libseccomp`)
* `libseccomp`
* `libselinux-devel` (`libselinux`)
* `libselinux-ruby` (`libselinux`)
* `libselinux-static` (`libselinux`)
* `libselinux-utils` (`libselinux`)
* `libsemanage-devel` (`libsemanage`)
* `libsemanage-static` (`libsemanage`)
* `libsepol-devel` (`libsepol`)
* `libsepol-static` (`libsepol`)
* `libservicelog-devel` (`libservicelog`; *ppc64, ppc64le*)
* `libservicelog` (*ppc64, ppc64le*)
* `libsmartcols-devel` (`util-linux`)
* `libsmartcols` (`util-linux`)
* `libsmbclient-devel` (`samba`)
* `libsmbclient` (`samba`)
* `libsss_autofs` (`sssd`)
* `libsss_certmap-devel` (`sssd`)
* `libsss_certmap` (`sssd`)
* `libsss_idmap-devel` (`sssd`)
* `libsss_idmap` (`sssd`)
* `libsss_nss_idmap-devel` (`sssd`)
* `libsss_nss_idmap` (`sssd`)
* `libsss_simpleifp-devel` (`sssd`)
* `libsss_simpleifp` (`sssd`)
* `libsss_sudo` (`sssd`)
* `libstoragemgmt-devel` (`libstoragemgmt`)
* `libstoragemgmt-hpsa-plugin` (`libstoragemgmt`)
* `libstoragemgmt-megaraid-plugin` (`libstoragemgmt`)
* `libstoragemgmt-netapp-plugin` (`libstoragemgmt`)
* `libstoragemgmt-nstor-plugin` (`libstoragemgmt`)
* `libstoragemgmt-smis-plugin` (`libstoragemgmt`)
* `libstoragemgmt-targetd-plugin` (`libstoragemgmt`)
* `libstoragemgmt-udev` (`libstoragemgmt`)
* `libstoragemgmt`
* `libtirpc`
* `libunwind-devel` (`libunwind`; *aarch64, armv7hl, i686, ppc64, ppc64le, x86_64*)
* `libunwind` (*aarch64, armv7hl, i686, ppc64, ppc64le, x86_64*)
* `libuuid-devel` (`util-linux`)
* `libuuid` (`util-linux`)
* `libvirt-admin` (`libvirt`)
* `libvirt-cim`
* `libvirt-client` (`libvirt`)
* `libvirt-daemon-config-network` (`libvirt`)
* `libvirt-daemon-config-nwfilter` (`libvirt`)
* `libvirt-daemon-driver-interface` (`libvirt`)
* `libvirt-daemon-driver-libxl` (`libvirt`; *i686, x86_64*)
* `libvirt-daemon-driver-lxc` (`libvirt`)
* `libvirt-daemon-driver-network` (`libvirt`)
* `libvirt-daemon-driver-nodedev` (`libvirt`)
* `libvirt-daemon-driver-nwfilter` (`libvirt`)
* `libvirt-daemon-driver-qemu` (`libvirt`)
* `libvirt-daemon-driver-secret` (`libvirt`)
* `libvirt-daemon-driver-storage-core` (`libvirt`)
* `libvirt-daemon-driver-storage-disk` (`libvirt`)
* `libvirt-daemon-driver-storage-gluster` (`libvirt`)
* `libvirt-daemon-driver-storage-iscsi` (`libvirt`)
* `libvirt-daemon-driver-storage-logical` (`libvirt`)
* `libvirt-daemon-driver-storage-mpath` (`libvirt`)
* `libvirt-daemon-driver-storage-rbd` (`libvirt`)
* `libvirt-daemon-driver-storage-scsi` (`libvirt`)
* `libvirt-daemon-driver-storage-sheepdog` (`libvirt`)
* `libvirt-daemon-driver-storage-zfs` (`libvirt`; *armv7hl, i686, ppc64, ppc64le, x86_64*)
* `libvirt-daemon-driver-storage` (`libvirt`)
* `libvirt-daemon-driver-uml` (`libvirt`)
* `libvirt-daemon-driver-vbox` (`libvirt`; *i686, x86_64*)
* `libvirt-daemon-driver-xen` (`libvirt`; *i686, x86_64*)
* `libvirt-daemon-kvm` (`libvirt`)
* `libvirt-daemon-lxc` (`libvirt`)
* `libvirt-daemon-qemu` (`libvirt`)
* `libvirt-daemon-uml` (`libvirt`)
* `libvirt-daemon-vbox` (`libvirt`; *i686, x86_64*)
* `libvirt-daemon-xen` (`libvirt`; *i686, x86_64*)
* `libvirt-daemon` (`libvirt`)
* `libvirt-devel` (`libvirt`)
* `libvirt-docs` (`libvirt`)
* `libvirt-gconfig-devel` (`libvirt-glib`)
* `libvirt-gconfig` (`libvirt-glib`)
* `libvirt-glib-devel` (`libvirt-glib`)
* `libvirt-glib`
* `libvirt-gobject-devel` (`libvirt-glib`)
* `libvirt-gobject` (`libvirt-glib`)
* `libvirt-java-devel` (`libvirt-java`)
* `libvirt-java-javadoc` (`libvirt-java`)
* `libvirt-java`
* `libvirt-libs` (`libvirt`)
* `libvirt-lock-sanlock` (`libvirt`)
* `libvirt-login-shell` (`libvirt`)
* `libvirt-nss` (`libvirt`)
* `libvirt-wireshark` (`libvirt`)
* `libvirt`
* `libvma-utils` (`libvma`; *aarch64, i686, ppc64, ppc64le, x86_64*)
* `libvma` (*aarch64, i686, ppc64, ppc64le, x86_64*)
* `libvmem-debug` (`nvml`; *x86_64*)
* `libvmem-devel` (`nvml`; *x86_64*)
* `libvmem` (`nvml`; *x86_64*)
* `libvmmalloc-debug` (`nvml`; *x86_64*)
* `libvmmalloc-devel` (`nvml`; *x86_64*)
* `libvmmalloc` (`nvml`; *x86_64*)
* `libvoikko-devel` (`libvoikko`)
* `libvoikko`
* `libvpd-devel` (`libvpd`; *ppc64, ppc64le*)
* `libvpd` (*ppc64, ppc64le*)
* `libwayland-client` (`wayland`)
* `libwayland-cursor` (`wayland`)
* `libwayland-server` (`wayland`)
* `libwbclient-devel` (`samba`)
* `libwbclient` (`samba`)
* `libXvMC-devel` (`libXvMC`)
* `libXvMC`
* `libzfcphbaapi-docs` (`libzfcphbaapi`; *s390x*)
* `libzfcphbaapi` (*s390x*)
* `linux-firmware`
* `linuxptp`
* `lklug-fonts`
* `lksctp-tools-devel` (`lksctp-tools`)
* `lksctp-tools`
* `lldpad-devel` (`lldpad`)
* `lldpad`
* `lldpd-devel` (`lldpd`)
* `lldpd`
* `lm_sensors-devel` (`lm_sensors`)
* `lm_sensors-libs` (`lm_sensors`)
* `lm_sensors-sensord` (`lm_sensors`)
* `lm_sensors`
* `logrotate`
* `logwatch`
* `lohit-assamese-fonts`
* `lohit-bengali-fonts`
* `lohit-devanagari-fonts`
* `lohit-gujarati-fonts`
* `lohit-gurmukhi-fonts`
* `lohit-kannada-fonts`
* `lohit-malayalam-fonts`
* `lohit-marathi-fonts`
* `lohit-nepali-fonts`
* `lohit-odia-fonts`
* `lohit-tamil-fonts`
* `lohit-telugu-fonts`
* `lshw-gui` (`lshw`)
* `lshw`
* `lsof`
* `lsscsi`
* `lsvpd` (*ppc64, ppc64le*)
* `ltrace`
* `lua-devel` (`lua`)
* `lua-guestfs` (`libguestfs`)
* `lua-libs` (`lua`)
* `lua-static` (`lua`)
* `lua`
* `luksmeta`
* `lvm2-cluster-standalone` (`lvm2`)
* `lvm2-cluster` (`lvm2`)
* `lvm2-dbusd` (`lvm2`)
* `lvm2-devel` (`lvm2`)
* `lvm2-libs` (`lvm2`)
* `lvm2-lockd` (`lvm2`)
* `lvm2`
* `lzop`
* `madan-fonts`
* `mailman`
* `malaga-devel` (`malaga`)
* `malaga-suomi-voikko`
* `malaga`
* `man-pages-cs`
* `man-pages-es-extra` (`man-pages-es`)
* `man-pages-es`
* `man-pages-fr`
* `man-pages-it`
* `man-pages-ja`
* `man-pages-ko`
* `man-pages-pl`
* `man-pages-ru`
* `man-pages-zh-CN`
* `man-pages`
* `mariadb-connect-engine` (`mariadb`)
* `mariadb-embedded-devel` (`mariadb`)
* `mariadb-embedded` (`mariadb`)
* `mariadb-oqgraph-engine` (`mariadb`)
* `mariadb-server-galera` (`mariadb`)
* `mariadb-server-utils` (`mariadb`)
* `mariadb-server` (`mariadb`)
* `mariadb`
* `maven`
* `mc`
* `mcelog` (*i686, x86_64*)
* `mdadm`
* `media-player-info`
* `memcached`
* `memstomp`
* `memtest86+` (*i686, x86_64*)
* `mesa-libGLw-devel` (`mesa-libGLw`)
* `mesa-libGLw`
* `mesa-libwayland-egl` (`mesa`)
* `metacity`
* `microdnf`
* `minicom`
* `mksh`
* `mlocate`
* `mobile-broadband-provider-info`
* `mod_auth_gssapi`
* `mod_auth_mellon`
* `mod_auth_openidc`
* `mod_authnz_pam`
* `mod_dav_svn` (`subversion`)
* `mod_fcgid`
* `mod_http2`
* `mod_intercept_form_submit`
* `mod_ldap` (`httpd`)
* `mod_lookup_identity`
* `mod_nss`
* `mod_proxy_html` (`httpd`)
* `mod_security_crs`
* `mod_security`
* `mod_session` (`httpd`)
* `mod_ssl` (`httpd`)
* `ModemManager-devel` (`ModemManager`)
* `ModemManager-glib-devel` (`ModemManager`)
* `ModemManager-glib` (`ModemManager`)
* `ModemManager-vala` (`ModemManager`)
* `ModemManager`
* `mongo-c-driver-devel` (`mongo-c-driver`)
* `mongo-c-driver`
* `mongo-cxx-driver-devel` (`mongo-cxx-driver`)
* `mongodb-server` (`mongodb`)
* `mongodb`
* `motif`
* `mousetweaks`
* `mozvoikko`
* `mpg123-devel` (`mpg123`)
* `mpg123-libs` (`mpg123`)
* `mpg123-plugins-jack` (`mpg123`)
* `mpg123-plugins-portaudio` (`mpg123`)
* `mpg123-plugins-pulseaudio` (`mpg123`)
* `mpg123`
* `mrtg`
* `mstflint` (*aarch64, i686, ppc64, ppc64le, x86_64*)
* `mt-st`
* `mtr-gtk` (`mtr`)
* `mtr`
* `mtx`
* `mutt`
* `mysql-connector-java`
* `mythes-bg`
* `mythes-ca`
* `mythes-cs`
* `mythes-da`
* `mythes-de`
* `mythes-el`
* `mythes-es`
* `mythes-fr`
* `mythes-ga`
* `mythes-hu`
* `mythes-it`
* `mythes-lv` (`openoffice-lv`)
* `mythes-mi`
* `mythes-nb` (`hunspell-no`)
* `mythes-ne`
* `mythes-nl`
* `mythes-nn` (`hunspell-no`)
* `mythes-pl`
* `mythes-pt`
* `mythes-ro`
* `mythes-ru`
* `mythes-sk`
* `mythes-sl`
* `mythes-sv`
* `mythes-uk`
* `nafees-web-naskh-fonts`
* `nagios-plugins-bacula` (`bacula`)
* `nautilus-sendto`
* `naver-nanum-barun-gothic-fonts` (`naver-nanum-fonts`)
* `naver-nanum-gothic-fonts` (`naver-nanum-fonts`)
* `naver-nanum-myeongjo-fonts` (`naver-nanum-fonts`)
* `navilu-fonts`
* `ndctl-devel` (`ndctl`)
* `ndctl-libs` (`ndctl`)
* `ndctl`
* `net-tools`
* `netcf-devel` (`netcf`)
* `netcf-libs` (`netcf`)
* `netcf`
* `netdump-server`
* `netlabel_tools`
* `nettle-devel` (`nettle`)
* `nettle`
* `network-manager-applet`
* `NetworkManager-adsl` (`NetworkManager`)
* `NetworkManager-bluetooth` (`NetworkManager`)
* `NetworkManager-config-server` (`NetworkManager`)
* `NetworkManager-glib-devel` (`NetworkManager`)
* `NetworkManager-glib` (`NetworkManager`)
* `NetworkManager-libnm-devel` (`NetworkManager`)
* `NetworkManager-libnm` (`NetworkManager`)
* `NetworkManager-libreswan-gnome` (`NetworkManager-libreswan`)
* `NetworkManager-libreswan`
* `NetworkManager-ppp` (`NetworkManager`)
* `NetworkManager-team` (`NetworkManager`)
* `NetworkManager-tui` (`NetworkManager`)
* `NetworkManager-wifi` (`NetworkManager`)
* `NetworkManager-wwan` (`NetworkManager`)
* `NetworkManager`
* `nfs-utils`
* `nfs4-acl-tools`
* `nfsometer`
* `NFStest`
* `nftables`
* `nginx-filesystem` (`nginx`)
* `nginx-mod-http-geoip` (`nginx`)
* `nginx-mod-http-image-filter` (`nginx`)
* `nginx-mod-http-perl` (`nginx`)
* `nginx-mod-http-xslt-filter` (`nginx`)
* `nginx-mod-mail` (`nginx`)
* `nginx-mod-stream` (`nginx`)
* `nginx`
* `nm-connection-editor` (`network-manager-applet`)
* `nmap-ncat` (`nmap`)
* `nmap`
* `node-gyp`
* `nodejs`
* `notification-daemon`
* `npm` (`nodejs`)
* `nspr-devel` (`nspr`)
* `nspr`
* `nss-devel` (`nss`)
* `nss-pam-ldapd`
* `nss-tools` (`nss`)
* `nss`
* `ntfs-3g`
* `ntfsprogs` (`ntfs-3g`)
* `ntsysv` (`chkconfig`)
* `numad` (*aarch64, i686, ppc64, ppc64le, s390x, x86_64*)
* `nvme-cli`
* `nvmetcli`
* `nvml-tools` (`nvml`; *x86_64*)
* `ocaml-brlapi` (`brltty`)
* `ocaml-hivex-devel` (`hivex`)
* `ocaml-hivex` (`hivex`)
* `ocaml-libguestfs-devel` (`libguestfs`)
* `ocaml-libguestfs` (`libguestfs`)
* `ocaml-libvirt-devel` (`ocaml-libvirt`)
* `ocaml-libvirt`
* `omping`
* `opal-firmware` (`opal-prd`; *ppc64le*)
* `opal-prd` (*ppc64le*)
* `opal-utils` (`opal-prd`; *ppc64le*)
* `open-vm-tools-desktop` (`open-vm-tools`; *i686, x86_64*)
* `open-vm-tools-devel` (`open-vm-tools`; *i686, x86_64*)
* `open-vm-tools` (*i686, x86_64*)
* `opencryptoki-ccatok` (`opencryptoki`; *s390x*)
* `opencryptoki-devel` (`opencryptoki`)
* `opencryptoki-ep11tok` (`opencryptoki`; *s390x*)
* `opencryptoki-icatok` (`opencryptoki`; *s390x*)
* `opencryptoki-icsftok` (`opencryptoki`)
* `opencryptoki-libs` (`opencryptoki`)
* `opencryptoki-swtok` (`opencryptoki`)
* `opencryptoki-tpmtok` (`opencryptoki`)
* `opencryptoki`
* `openhpi-devel` (`openhpi`)
* `openhpi-libs` (`openhpi`)
* `openhpi`
* `OpenIPMI-devel` (`OpenIPMI`)
* `OpenIPMI-lanserv` (`OpenIPMI`)
* `OpenIPMI-libs` (`OpenIPMI`)
* `OpenIPMI-perl` (`OpenIPMI`)
* `OpenIPMI`
* `openldap-clients` (`openldap`)
* `openldap-devel` (`openldap`)
* `openldap-servers` (`openldap`)
* `openldap`
* `opensc`
* `opensm` (*aarch64, i686, ppc64, ppc64le, x86_64*)
* `openssh-askpass` (`openssh`)
* `openssh-clients` (`openssh`)
* `openssh-keycat` (`openssh`)
* `openssh-server` (`openssh`)
* `openssl-devel` (`openssl`)
* `openssl-ibmca` (*s390x*)
* `openssl-libs` (`openssl`)
* `openssl-perl` (`openssl`)
* `openssl-static` (`openssl`)
* `openssl`
* `openvswitch-devel` (`openvswitch`)
* `openvswitch-ovn-central` (`openvswitch`)
* `openvswitch-ovn-common` (`openvswitch`)
* `openvswitch-ovn-docker` (`openvswitch`)
* `openvswitch-ovn-host` (`openvswitch`)
* `openvswitch-ovn-vtep` (`openvswitch`)
* `openvswitch-test` (`openvswitch`)
* `openvswitch`
* `oprofile-devel` (`oprofile`)
* `oprofile-jit` (`oprofile`)
* `oprofile`
* `orca`
* `oscap-anaconda-addon`
* `ostree`
* `overpass-fonts`
* `p11-kit`
* `pacemaker-cli` (`pacemaker`)
* `pacemaker-cluster-libs` (`pacemaker`)
* `pacemaker-cts` (`pacemaker`)
* `pacemaker-doc` (`pacemaker`)
* `pacemaker-libs-devel` (`pacemaker`)
* `pacemaker-libs` (`pacemaker`)
* `pacemaker-nagios-plugins-metadata` (`pacemaker`)
* `pacemaker-remote` (`pacemaker`)
* `pacemaker`
* `paktype-naqsh-fonts`
* `paktype-naskh-basic-fonts`
* `paktype-tehreer-fonts`
* `pam-devel` (`pam`)
* `pam_snapper` (`snapper`)
* `pam_ssh_agent_auth` (`openssh`)
* `pam`
* `paps-devel` (`paps`)
* `paps-libs` (`paps`)
* `paps`
* `paratype-pt-sans-fonts`
* `passenger`
* `pavucontrol`
* `pciutils`
* `pcmciautils` (*armv7hl, i686, ppc64, x86_64*)
* `pcs`
* `pcsc-lite-ccid`
* `pcsc-lite-libs` (`pcsc-lite`)
* `pcsc-lite`
* `perftest` (*aarch64, i686, ppc64, ppc64le, x86_64*)
* `perl-App-cpanminus`
* `perl-Archive-Tar`
* `perl-Attribute-Handlers` (`perl`)
* `perl-autodie`
* `perl-B-Debug`
* `perl-bignum`
* `perl-Carp`
* `perl-Compress-Raw-Bzip2`
* `perl-Compress-Raw-Zlib`
* `perl-Config-Perl-V`
* `perl-constant`
* `perl-CPAN-Meta-Requirements`
* `perl-CPAN-Meta-YAML`
* `perl-CPAN-Meta`
* `perl-CPAN`
* `perl-Crypt-SSLeay`
* `perl-Data-Dumper`
* `perl-DB_File`
* `perl-Devel-Peek` (`perl`)
* `perl-Devel-PPPort`
* `perl-Devel-SelfStubber` (`perl`)
* `perl-devel` (`perl`)
* `perl-Digest-MD5`
* `perl-Digest-SHA`
* `perl-Digest`
* `perl-Encode-devel` (`perl-Encode`)
* `perl-Encode`
* `perl-encoding` (`perl-Encode`)
* `perl-Env`
* `perl-Errno` (`perl`)
* `perl-experimental`
* `perl-Exporter`
* `perl-ExtUtils-CBuilder`
* `perl-ExtUtils-Command` (`perl-ExtUtils-MakeMaker`)
* `perl-ExtUtils-Embed` (`perl`)
* `perl-ExtUtils-Install`
* `perl-ExtUtils-MakeMaker`
* `perl-ExtUtils-Manifest`
* `perl-ExtUtils-Miniperl` (`perl`)
* `perl-ExtUtils-MM-Utils` (`perl-ExtUtils-MakeMaker`)
* `perl-ExtUtils-ParseXS`
* `perl-File-Fetch`
* `perl-File-Path`
* `perl-File-Temp`
* `perl-Filter-Simple`
* `perl-Filter`
* `perl-generators`
* `perl-Getopt-Long`
* `perl-hivex` (`hivex`)
* `perl-HTTP-Tiny`
* `perl-interpreter` (`perl`)
* `perl-IO-Compress`
* `perl-IO-Socket-IP`
* `perl-IO-Zlib` (`perl`)
* `perl-IO` (`perl`)
* `perl-IPC-Cmd`
* `perl-IPC-SysV`
* `perl-JSON-PP`
* `perl-libnet`
* `perl-libnetcfg` (`perl`)
* `perl-libs` (`perl`)
* `perl-Locale-Codes`
* `perl-Locale-Maketext-Simple` (`perl`)
* `perl-Locale-Maketext`
* `perl-LWP-Protocol-https`
* `perl-macros` (`perl`)
* `perl-Math-BigInt-FastCalc`
* `perl-Math-BigInt`
* `perl-Math-BigRat`
* `perl-Math-Complex` (`perl`)
* `perl-Memoize` (`perl`)
* `perl-MIME-Base64`
* `perl-Module-CoreList-tools` (`perl-Module-CoreList`)
* `perl-Module-CoreList`
* `perl-Module-Load-Conditional`
* `perl-Module-Load`
* `perl-Module-Loaded` (`perl`)
* `perl-Module-Metadata`
* `perl-Mozilla-CA`
* `perl-Net-Ping` (`perl`)
* `perl-open` (`perl`)
* `perl-Params-Check`
* `perl-parent`
* `perl-PathTools`
* `perl-Perl-OSType`
* `perl-perlfaq`
* `perl-PerlIO-via-QuotedPrint`
* `perl-Pod-Checker`
* `perl-Pod-Escapes`
* `perl-Pod-Html` (`perl`)
* `perl-Pod-Parser`
* `perl-Pod-Perldoc`
* `perl-Pod-Simple`
* `perl-Pod-Usage`
* `perl-podlators`
* `perl-Scalar-List-Utils`
* `perl-SelfLoader` (`perl`)
* `perl-Socket`
* `perl-Storable`
* `perl-Sys-Guestfs` (`libguestfs`)
* `perl-Sys-Syslog`
* `perl-Term-ANSIColor`
* `perl-Term-Cap`
* `perl-Test-Harness`
* `perl-Test-Simple`
* `perl-Test` (`perl`)
* `perl-tests` (`perl`)
* `perl-Text-Balanced`
* `perl-Text-ParseWords`
* `perl-Text-Tabs+Wrap`
* `perl-Thread-Queue`
* `perl-threads-shared`
* `perl-threads`
* `perl-Time-HiRes`
* `perl-Time-Local`
* `perl-Time-Piece` (`perl`)
* `perl-Unicode-Collate`
* `perl-Unicode-Normalize`
* `perl-utils` (`perl`)
* `perl-version`
* `perl`
* `php-bcmath` (`php`)
* `php-cli` (`php`)
* `php-common` (`php`)
* `php-dba` (`php`)
* `php-dbg` (`php`)
* `php-devel` (`php`)
* `php-embedded` (`php`)
* `php-enchant` (`php`)
* `php-fpm` (`php`)
* `php-gd` (`php`)
* `php-gmp` (`php`)
* `php-intl` (`php`)
* `php-json` (`php`)
* `php-ldap` (`php`)
* `php-libguestfs` (`libguestfs`)
* `php-mbstring` (`php`)
* `php-mysqlnd` (`php`)
* `php-odbc` (`php`)
* `php-opcache` (`php`)
* `php-pdo-dblib` (`php`)
* `php-pdo` (`php`)
* `php-pecl-apcu`
* `php-pecl-memcache`
* `php-pgsql` (`php`)
* `php-process` (`php`)
* `php-pspell` (`php`)
* `php-recode` (`php`)
* `php-snmp` (`php`)
* `php-soap` (`php`)
* `php-tidy` (`php`)
* `php-xml` (`php`)
* `php-xmlrpc` (`php`)
* `php`
* `pidgin-devel` (`pidgin`)
* `pidgin-docs` (`pidgin`)
* `pidgin-perl` (`pidgin`)
* `pidgin-sipe`
* `pidgin`
* `pigz`
* `pinentry-emacs` (`pinentry`)
* `pinentry-gnome3` (`pinentry`)
* `pinentry-gtk` (`pinentry`)
* `pinentry-qt` (`pinentry`)
* `pinentry`
* `pinfo`
* `pipewire-devel` (`pipewire`)
* `pipewire-doc` (`pipewire`)
* `pipewire-libs` (`pipewire`)
* `pipewire-utils` (`pipewire`)
* `pipewire`
* `pkpgcounter`
* `platform-python-hawkey` (`libdnf`)
* `platform-python-libcomps` (`libcomps`)
* `platform-python-librepo` (`librepo`)
* `platform-python-rpm` (`rpm`)
* `plymouth`
* `pnm2ppa`
* `policycoreutils-dbus` (`policycoreutils`)
* `policycoreutils-devel` (`policycoreutils`)
* `policycoreutils-gui` (`policycoreutils`)
* `policycoreutils-newrole` (`policycoreutils`)
* `policycoreutils-python-utils` (`policycoreutils`)
* `policycoreutils-python3` (`policycoreutils`)
* `policycoreutils-restorecond` (`policycoreutils`)
* `policycoreutils-sandbox` (`policycoreutils`)
* `policycoreutils`
* `popt-devel` (`popt`)
* `popt-static` (`popt`)
* `popt`
* `portreserve`
* `postfix-perl-scripts` (`postfix`)
* `postfix`
* `postgresql-contrib` (`postgresql`)
* `postgresql-devel` (`postgresql`)
* `postgresql-jdbc`
* `postgresql-odbc`
* `postgresql-server` (`postgresql`)
* `postgresql-upgrade` (`postgresql`)
* `postgresql`
* `pothana2000-fonts`
* `powerpc-utils-core` (`powerpc-utils`; *ppc64, ppc64le*)
* `powerpc-utils` (*ppc64, ppc64le*)
* `powertop`
* `ppc64-diag` (*ppc64, ppc64le*)
* `ppc64-utils` (*ppc64, ppc64le*)
* `pprof` (`gperftools`)
* `procmail`
* `ps_mem`
* `psacct`
* `ptouch-driver`
* `purple-sipe` (`pidgin-sipe`)
* `python-libcomps-doc` (`libcomps`)
* `python-psycopg2-doc` (`python-psycopg2`)
* `python-pwquality` (`libpwquality`)
* `python-rhsm-certificates` (`python-rhsm`)
* `python-rhsm`
* `python-rtslib-doc` (`python-rtslib`)
* `python2-abrt-addon` (`abrt`)
* `python2-abrt-doc` (`abrt`)
* `python2-abrt` (`abrt`)
* `python2-brlapi` (`brltty`)
* `python2-clufter` (`clufter`)
* `python2-configshell` (`python-configshell`)
* `python2-createrepo_c` (`createrepo_c`)
* `python2-criu` (`criu`; *aarch64, armv7hl, ppc64le, x86_64*)
* `python2-cryptsetup` (`cryptsetup`)
* `python2-custodia-extra` (`custodia`)
* `python2-custodia` (`custodia`)
* `python2-deltarpm` (`deltarpm`)
* `python2-di` (`python-di`)
* `python2-dnf-plugin-kickstart` (`dnf-plugins-extras`)
* `python2-dnf-plugin-leaves` (`dnf-plugins-core`)
* `python2-dnf-plugin-local` (`dnf-plugins-core`)
* `python2-dnf-plugin-migrate` (`dnf-plugins-core`)
* `python2-dnf-plugin-show-leaves` (`dnf-plugins-core`)
* `python2-dnf-plugin-snapper` (`dnf-plugins-extras`)
* `python2-dnf-plugin-system-upgrade` (`dnf-plugins-extras`)
* `python2-dnf-plugin-tracer` (`dnf-plugins-extras`)
* `python2-dnf-plugin-versionlock` (`dnf-plugins-core`)
* `python2-dnf-plugins-core` (`dnf-plugins-core`)
* `python2-dnf-plugins-extras-common` (`dnf-plugins-extras`)
* `python2-dnf` (`dnf`)
* `python2-hawkey` (`libdnf`)
* `python2-hivex` (`hivex`)
* `python2-i2c-tools` (`i2c-tools`; *aarch64, armv7hl, i686, ppc64, ppc64le, x86_64*)
* `python2-ipaclient` (`freeipa`)
* `python2-ipaddr` (`python-ipaddr`)
* `python2-ipalib` (`freeipa`)
* `python2-ipaserver` (`freeipa`)
* `python2-ipatests` (`freeipa`)
* `python2-iscsi-initiator-utils` (`iscsi-initiator-utils`)
* `python2-keycloak-httpd-client-install` (`keycloak-httpd-client-install`)
* `python2-kmod` (`python-kmod`)
* `python2-libcomps` (`libcomps`)
* `python2-libguestfs` (`libguestfs`)
* `python2-libipa_hbac` (`sssd`)
* `python2-librepo` (`librepo`)
* `python2-libsss_nss_idmap` (`sssd`)
* `python2-libstoragemgmt-clibs` (`libstoragemgmt`)
* `python2-libstoragemgmt` (`libstoragemgmt`)
* `python2-libvirt` (`libvirt-python`)
* `python2-libvoikko` (`libvoikko`)
* `python2-lvm-deprecated` (`lvm2`)
* `python2-magic` (`file`)
* `python2-openipmi` (`OpenIPMI`)
* `python2-openvswitch` (`openvswitch`)
* `python2-policycoreutils` (`policycoreutils`)
* `python2-powerpc-utils` (`powerpc-utils-python`)
* `python2-psycopg2-debug` (`python-psycopg2`)
* `python2-psycopg2-tests` (`python-psycopg2`)
* `python2-psycopg2` (`python-psycopg2`)
* `python2-pyOpenSSL` (`pyOpenSSL`)
* `python2-requests-oauthlib` (`python-requests-oauthlib`)
* `python2-rhnlib` (`rhnlib`)
* `python2-rpm` (`rpm`)
* `python2-rtslib` (`python-rtslib`)
* `python2-samba-test` (`samba`)
* `python2-samba` (`samba`)
* `python2-sanlock` (`sanlock`)
* `python2-setproctitle` (`python-setproctitle`)
* `python2-sss-murmur` (`sssd`)
* `python2-sss` (`sssd`)
* `python2-sssdconfig` (`sssd`)
* `python3-abrt-addon` (`abrt`)
* `python3-abrt-doc` (`abrt`)
* `python3-abrt` (`abrt`)
* `python3-blivet` (`python-blivet`)
* `python3-brlapi` (`brltty`)
* `python3-clufter` (`clufter`)
* `python3-configshell` (`python-configshell`)
* `python3-createrepo_c` (`createrepo_c`)
* `python3-custodia-extra` (`custodia`)
* `python3-custodia` (`custodia`)
* `python3-deltarpm` (`deltarpm`)
* `python3-devel` (`python3`)
* `python3-dnf-plugin-kickstart` (`dnf-plugins-extras`)
* `python3-dnf-plugin-leaves` (`dnf-plugins-core`)
* `python3-dnf-plugin-local` (`dnf-plugins-core`)
* `python3-dnf-plugin-rpmconf` (`dnf-plugins-extras`)
* `python3-dnf-plugin-show-leaves` (`dnf-plugins-core`)
* `python3-dnf-plugin-snapper` (`dnf-plugins-extras`)
* `python3-dnf-plugin-system-upgrade` (`dnf-plugins-extras`)
* `python3-dnf-plugin-torproxy` (`dnf-plugins-extras`)
* `python3-dnf-plugin-tracer` (`dnf-plugins-extras`)
* `python3-dnf-plugin-versionlock` (`dnf-plugins-core`)
* `python3-dnf-plugins-core` (`dnf-plugins-core`)
* `python3-dnf-plugins-extras-common` (`dnf-plugins-extras`)
* `python3-dnf` (`dnf`)
* `python3-hawkey` (`libdnf`)
* `python3-hivex` (`hivex`)
* `python3-ipaclient` (`freeipa`)
* `python3-ipalib` (`freeipa`)
* `python3-ipaserver` (`freeipa`)
* `python3-ipatests` (`freeipa`)
* `python3-iscsi-initiator-utils` (`iscsi-initiator-utils`)
* `python3-keycloak-httpd-client-install` (`keycloak-httpd-client-install`)
* `python3-kmod` (`python-kmod`)
* `python3-libcomps` (`libcomps`)
* `python3-libguestfs` (`libguestfs`)
* `python3-libipa_hbac` (`sssd`)
* `python3-libmount` (`util-linux`)
* `python3-librepo` (`librepo`)
* `python3-libs` (`python3`)
* `python3-libselinux` (`libselinux`)
* `python3-libsss_nss_idmap` (`sssd`)
* `python3-libstoragemgmt-clibs` (`libstoragemgmt`)
* `python3-libstoragemgmt` (`libstoragemgmt`)
* `python3-libvirt` (`libvirt-python`)
* `python3-lvm-deprecated` (`lvm2`)
* `python3-magic` (`file`)
* `python3-openvswitch` (`openvswitch`)
* `python3-pip` (`python-pip`)
* `python3-psycopg2-debug` (`python-psycopg2`)
* `python3-psycopg2-tests` (`python-psycopg2`)
* `python3-psycopg2` (`python-psycopg2`)
* `python3-pwquality` (`libpwquality`)
* `python3-pyOpenSSL` (`pyOpenSSL`)
* `python3-requests-oauthlib` (`python-requests-oauthlib`)
* `python3-rhnlib` (`rhnlib`)
* `python3-rpm` (`rpm`)
* `python3-rtslib` (`python-rtslib`)
* `python3-samba-test` (`samba`)
* `python3-samba` (`samba`)
* `python3-setools` (`setools`)
* `python3-setproctitle` (`python-setproctitle`)
* `python3-setuptools` (`python-setuptools`)
* `python3-sss-murmur` (`sssd`)
* `python3-sss` (`sssd`)
* `python3-sssdconfig` (`sssd`)
* `python3-tkinter` (`python3`)
* `python3`
* `qclib-devel` (`qclib`; *s390x*)
* `qclib-static` (`qclib`; *s390x*)
* `qclib` (*s390x*)
* `qemu-block-curl` (`qemu`)
* `qemu-block-dmg` (`qemu`)
* `qemu-block-gluster` (`qemu`)
* `qemu-block-iscsi` (`qemu`)
* `qemu-block-nfs` (`qemu`)
* `qemu-block-rbd` (`qemu`; *aarch64, i686, ppc64le, s390x, x86_64*)
* `qemu-block-ssh` (`qemu`)
* `qemu-common` (`qemu`)
* `qemu-guest-agent` (`qemu`)
* `qemu-img` (`qemu`)
* `qemu-kvm-core` (`qemu`)
* `qemu-kvm` (`qemu`)
* `qemu-system-aarch64-core` (`qemu`)
* `qemu-system-aarch64` (`qemu`)
* `qemu-system-alpha-core` (`qemu`)
* `qemu-system-alpha` (`qemu`)
* `qemu-system-arm-core` (`qemu`)
* `qemu-system-arm` (`qemu`)
* `qemu-system-cris-core` (`qemu`)
* `qemu-system-cris` (`qemu`)
* `qemu-system-lm32-core` (`qemu`)
* `qemu-system-lm32` (`qemu`)
* `qemu-system-m68k-core` (`qemu`)
* `qemu-system-m68k` (`qemu`)
* `qemu-system-microblaze-core` (`qemu`)
* `qemu-system-microblaze` (`qemu`)
* `qemu-system-mips-core` (`qemu`)
* `qemu-system-mips` (`qemu`)
* `qemu-system-moxie-core` (`qemu`)
* `qemu-system-moxie` (`qemu`)
* `qemu-system-nios2-core` (`qemu`)
* `qemu-system-nios2` (`qemu`)
* `qemu-system-or1k-core` (`qemu`)
* `qemu-system-or1k` (`qemu`)
* `qemu-system-ppc-core` (`qemu`)
* `qemu-system-ppc` (`qemu`)
* `qemu-system-s390x-core` (`qemu`)
* `qemu-system-s390x` (`qemu`)
* `qemu-system-sh4-core` (`qemu`)
* `qemu-system-sh4` (`qemu`)
* `qemu-system-sparc-core` (`qemu`)
* `qemu-system-sparc` (`qemu`)
* `qemu-system-tricore-core` (`qemu`)
* `qemu-system-tricore` (`qemu`)
* `qemu-system-unicore32-core` (`qemu`)
* `qemu-system-unicore32` (`qemu`)
* `qemu-system-x86-core` (`qemu`)
* `qemu-system-x86` (`qemu`)
* `qemu-system-xtensa-core` (`qemu`)
* `qemu-system-xtensa` (`qemu`)
* `qemu-user-binfmt` (`qemu`)
* `qemu-user` (`qemu`)
* `qemu`
* `qgnomeplatform`
* `qpdf`
* `qt-assistant` (`qt`)
* `qt-config` (`qt`)
* `qt-demos` (`qt`)
* `qt-devel-private` (`qt`)
* `qt-devel` (`qt`)
* `qt-doc` (`qt`)
* `qt-examples` (`qt`)
* `qt-mysql` (`qt`)
* `qt-odbc` (`qt`)
* `qt-postgresql` (`qt`)
* `qt-qdbusviewer` (`qt`)
* `qt-qvfb` (`qt`)
* `qt-x11` (`qt`)
* `qt5-assistant` (`qt5-qttools`)
* `qt5-designer` (`qt5-qttools`)
* `qt5-doctools` (`qt5-qttools`)
* `qt5-linguist` (`qt5-qttools`)
* `qt5-qdbusviewer` (`qt5-qttools`)
* `qt5-qt3d-devel` (`qt5-qt3d`)
* `qt5-qt3d-doc` (`qt5-doc`)
* `qt5-qt3d-examples` (`qt5-qt3d`)
* `qt5-qt3d`
* `qt5-qtbase-common` (`qt5-qtbase`)
* `qt5-qtbase-devel` (`qt5-qtbase`)
* `qt5-qtbase-doc` (`qt5-doc`)
* `qt5-qtbase-examples` (`qt5-qtbase`)
* `qt5-qtbase-gui` (`qt5-qtbase`)
* `qt5-qtbase-mysql` (`qt5-qtbase`)
* `qt5-qtbase-odbc` (`qt5-qtbase`)
* `qt5-qtbase-postgresql` (`qt5-qtbase`)
* `qt5-qtbase-static` (`qt5-qtbase`)
* `qt5-qtbase`
* `qt5-qtcanvas3d-doc` (`qt5-doc`)
* `qt5-qtcanvas3d-examples` (`qt5-qtcanvas3d`)
* `qt5-qtcanvas3d`
* `qt5-qtconnectivity-devel` (`qt5-qtconnectivity`)
* `qt5-qtconnectivity-doc` (`qt5-doc`)
* `qt5-qtconnectivity-examples` (`qt5-qtconnectivity`)
* `qt5-qtconnectivity`
* `qt5-qtdeclarative-devel` (`qt5-qtdeclarative`)
* `qt5-qtdeclarative-doc` (`qt5-doc`)
* `qt5-qtdeclarative-examples` (`qt5-qtdeclarative`)
* `qt5-qtdeclarative-static` (`qt5-qtdeclarative`)
* `qt5-qtdeclarative`
* `qt5-qtdoc`
* `qt5-qtenginio-devel` (`qt5-qtenginio`)
* `qt5-qtenginio-examples` (`qt5-qtenginio`)
* `qt5-qtenginio`
* `qt5-qtgraphicaleffects-doc` (`qt5-doc`)
* `qt5-qtgraphicaleffects`
* `qt5-qtimageformats-doc` (`qt5-doc`)
* `qt5-qtimageformats`
* `qt5-qtlocation-devel` (`qt5-qtlocation`)
* `qt5-qtlocation-doc` (`qt5-doc`)
* `qt5-qtlocation-examples` (`qt5-qtlocation`)
* `qt5-qtlocation`
* `qt5-qtmultimedia-devel` (`qt5-qtmultimedia`)
* `qt5-qtmultimedia-doc` (`qt5-doc`)
* `qt5-qtmultimedia-examples` (`qt5-qtmultimedia`)
* `qt5-qtmultimedia`
* `qt5-qtquickcontrols-doc` (`qt5-doc`)
* `qt5-qtquickcontrols-examples` (`qt5-qtquickcontrols`)
* `qt5-qtquickcontrols2-devel` (`qt5-qtquickcontrols2`)
* `qt5-qtquickcontrols2-doc` (`qt5-doc`)
* `qt5-qtquickcontrols2-examples` (`qt5-qtquickcontrols2`)
* `qt5-qtquickcontrols2`
* `qt5-qtquickcontrols`
* `qt5-qtscript-devel` (`qt5-qtscript`)
* `qt5-qtscript-doc` (`qt5-doc`)
* `qt5-qtscript-examples` (`qt5-qtscript`)
* `qt5-qtscript`
* `qt5-qtsensors-devel` (`qt5-qtsensors`)
* `qt5-qtsensors-doc` (`qt5-doc`)
* `qt5-qtsensors-examples` (`qt5-qtsensors`)
* `qt5-qtsensors`
* `qt5-qtserialbus-devel` (`qt5-qtserialbus`)
* `qt5-qtserialbus-doc` (`qt5-doc`)
* `qt5-qtserialbus-examples` (`qt5-qtserialbus`)
* `qt5-qtserialbus`
* `qt5-qtserialport-devel` (`qt5-qtserialport`)
* `qt5-qtserialport-doc` (`qt5-doc`)
* `qt5-qtserialport-examples` (`qt5-qtserialport`)
* `qt5-qtserialport`
* `qt5-qtsvg-devel` (`qt5-qtsvg`)
* `qt5-qtsvg-doc` (`qt5-doc`)
* `qt5-qtsvg-examples` (`qt5-qtsvg`)
* `qt5-qtsvg`
* `qt5-qttools-common` (`qt5-qttools`)
* `qt5-qttools-devel` (`qt5-qttools`)
* `qt5-qttools-doc` (`qt5-doc`)
* `qt5-qttools-examples` (`qt5-qttools`)
* `qt5-qttools-libs-designer` (`qt5-qttools`)
* `qt5-qttools-libs-designercomponents` (`qt5-qttools`)
* `qt5-qttools-libs-help` (`qt5-qttools`)
* `qt5-qttools-static` (`qt5-qttools`)
* `qt5-qttools`
* `qt5-qttranslations`
* `qt5-qtwayland-devel` (`qt5-qtwayland`)
* `qt5-qtwayland-examples` (`qt5-qtwayland`)
* `qt5-qtwayland`
* `qt5-qtwebchannel-devel` (`qt5-qtwebchannel`)
* `qt5-qtwebchannel-doc` (`qt5-doc`)
* `qt5-qtwebchannel-examples` (`qt5-qtwebchannel`)
* `qt5-qtwebchannel`
* `qt5-qtwebsockets-devel` (`qt5-qtwebsockets`)
* `qt5-qtwebsockets-doc` (`qt5-doc`)
* `qt5-qtwebsockets-examples` (`qt5-qtwebsockets`)
* `qt5-qtwebsockets`
* `qt5-qtx11extras-devel` (`qt5-qtx11extras`)
* `qt5-qtx11extras-doc` (`qt5-doc`)
* `qt5-qtx11extras`
* `qt5-qtxmlpatterns-devel` (`qt5-qtxmlpatterns`)
* `qt5-qtxmlpatterns-doc` (`qt5-doc`)
* `qt5-qtxmlpatterns-examples` (`qt5-qtxmlpatterns`)
* `qt5-qtxmlpatterns`
* `qt5-rpm-macros` (`qt5`)
* `qt`
* `quagga-contrib` (`quagga`)
* `quagga`
* `quota`
* `rasdaemon` (*aarch64, armv7hl, i686, ppc64, ppc64le, x86_64*)
* `rdist`
* `rdma-core` (*aarch64, i686, ppc64, ppc64le, s390x, x86_64*)
* `realmd-devel-docs` (`realmd`)
* `realmd`
* `rear` (*i686, ppc64, ppc64le, x86_64*)
* `redhat-lsb-core` (`redhat-lsb`)
* `redhat-lsb-cxx` (`redhat-lsb`)
* `redhat-lsb-desktop` (`redhat-lsb`)
* `redhat-lsb-languages` (`redhat-lsb`)
* `redhat-lsb-printing` (`redhat-lsb`)
* `redhat-lsb-submod-multimedia` (`redhat-lsb`)
* `redhat-lsb-submod-security` (`redhat-lsb`)
* `redhat-lsb-supplemental` (`redhat-lsb`)
* `redhat-lsb-trialuse` (`redhat-lsb`)
* `redhat-lsb`
* `redis`
* `reiserfs-utils`
* `resource-agents`
* `rhn-check` (`rhn-client-tools`)
* `rhn-client-tools`
* `rhn-setup-gnome` (`rhn-client-tools`)
* `rhn-setup` (`rhn-client-tools`)
* `rhnsd`
* `rhythmbox-devel` (`rhythmbox`; *aarch64, armv7hl, i686, ppc64, ppc64le, x86_64*)
* `rhythmbox-lirc` (`rhythmbox`; *aarch64, armv7hl, i686, ppc64, ppc64le, x86_64*)
* `rhythmbox` (*aarch64, armv7hl, i686, ppc64, ppc64le, x86_64*)
* `rng-tools`
* `rpcbind`
* `rpm-apidocs` (`rpm`)
* `rpm-build-libs` (`rpm`)
* `rpm-build` (`rpm`)
* `rpm-cron` (`rpm`)
* `rpm-devel` (`rpm`)
* `rpm-libs` (`rpm`)
* `rpm-ostree`
* `rpm-plugin-ima` (`rpm`)
* `rpm-plugin-prioreset` (`rpm`)
* `rpm-plugin-selinux` (`rpm`)
* `rpm-plugin-syslog` (`rpm`)
* `rpm-plugin-systemd-inhibit` (`rpm`)
* `rpm-sign` (`rpm`)
* `rpm`
* `rpmemd` (`nvml`; *x86_64*)
* `rpmlint`
* `rstp`
* `rsync`
* `rsyslog-crypto` (`rsyslog`)
* `rsyslog-doc` (`rsyslog`)
* `rsyslog-elasticsearch` (`rsyslog`)
* `rsyslog-gnutls` (`rsyslog`)
* `rsyslog-gssapi` (`rsyslog`)
* `rsyslog-kafka` (`rsyslog`)
* `rsyslog-libdbi` (`rsyslog`)
* `rsyslog-mmaudit` (`rsyslog`)
* `rsyslog-mmjsonparse` (`rsyslog`)
* `rsyslog-mmnormalize` (`rsyslog`)
* `rsyslog-mmsnmptrapd` (`rsyslog`)
* `rsyslog-mysql` (`rsyslog`)
* `rsyslog-pgsql` (`rsyslog`)
* `rsyslog-relp` (`rsyslog`)
* `rsyslog-snmp` (`rsyslog`)
* `rsyslog-udpspoof` (`rsyslog`)
* `rsyslog`
* `ruby-devel` (`ruby`)
* `ruby-hivex` (`hivex`)
* `ruby-irb` (`ruby`)
* `ruby-libguestfs` (`libguestfs`)
* `ruby-libs` (`ruby`)
* `ruby`
* `rubygem-abrt-doc` (`rubygem-abrt`)
* `rubygem-abrt`
* `rubygem-bigdecimal` (`ruby`)
* `rubygem-bundler`
* `rubygem-did_you_mean` (`ruby`)
* `rubygem-io-console` (`ruby`)
* `rubygem-json` (`ruby`)
* `rubygem-minitest`
* `rubygem-net-telnet` (`ruby`)
* `rubygem-openssl` (`ruby`)
* `rubygem-power_assert` (`ruby`)
* `rubygem-psych` (`ruby`)
* `rubygem-rake` (`ruby`)
* `rubygem-rdoc` (`ruby`)
* `rubygem-test-unit` (`ruby`)
* `rubygem-xmlrpc` (`ruby`)
* `rubygems-devel` (`ruby`)
* `rubygems` (`ruby`)
* `s390utils-base` (`s390utils`; *s390x*)
* `s390utils-cmsfs-fuse` (`s390utils`; *s390x*)
* `saab-fonts`
* `samba-client-libs` (`samba`)
* `samba-client` (`samba`)
* `samba-common-libs` (`samba`)
* `samba-common-tools` (`samba`)
* `samba-common` (`samba`)
* `samba-dc-libs` (`samba`)
* `samba-dc` (`samba`)
* `samba-devel` (`samba`)
* `samba-krb5-printing` (`samba`)
* `samba-libs` (`samba`)
* `samba-pidl` (`samba`)
* `samba-test-libs` (`samba`)
* `samba-test` (`samba`)
* `samba-vfs-cephfs` (`samba`; *aarch64, ppc64le, s390x, x86_64*)
* `samba-vfs-glusterfs` (`samba`)
* `samba-winbind-clients` (`samba`)
* `samba-winbind-krb5-locator` (`samba`)
* `samba-winbind-modules` (`samba`)
* `samba-winbind` (`samba`)
* `samba`
* `samyak-devanagari-fonts` (`samyak-fonts`)
* `samyak-fonts-common` (`samyak-fonts`)
* `samyak-gujarati-fonts` (`samyak-fonts`)
* `samyak-malayalam-fonts` (`samyak-fonts`)
* `samyak-odia-fonts` (`samyak-fonts`)
* `samyak-tamil-fonts` (`samyak-fonts`)
* `sane-backends-doc` (`sane-backends`)
* `sane-backends`
* `sane-frontends`
* `sanlk-reset` (`sanlock`)
* `sanlock-devel` (`sanlock`)
* `sanlock-lib` (`sanlock`)
* `sanlock`
* `sarai-fonts`
* `sbd`
* `scap-security-guide`
* `scap-workbench`
* `scl-utils-build` (`scl-utils`)
* `scl-utils`
* `scrub`
* `seabios-bin` (`seabios`)
* `seabios`
* `seahorse-nautilus`
* `seahorse-sharing`
* `seahorse`
* `seavgabios-bin` (`seabios`)
* `selinux-policy-devel` (`selinux-policy`)
* `selinux-policy-minimum` (`selinux-policy`)
* `selinux-policy-mls` (`selinux-policy`)
* `selinux-policy-sandbox` (`selinux-policy`)
* `selinux-policy-targeted` (`selinux-policy`)
* `sendmail-cf` (`sendmail`)
* `sendmail-doc` (`sendmail`)
* `sendmail-milter-devel` (`sendmail`)
* `sendmail-milter` (`sendmail`)
* `sendmail`
* `servicelog` (*ppc64, ppc64le*)
* `setools-console-analyses` (`setools`)
* `setools-console` (`setools`)
* `setools-gui` (`setools`)
* `setroubleshoot-plugins`
* `setroubleshoot-server` (`setroubleshoot`)
* `setroubleshoot`
* `setserial` (*aarch64, armv7hl, i686, ppc64, ppc64le, x86_64*)
* `sg3_utils-devel` (`sg3_utils`)
* `sg3_utils-libs` (`sg3_utils`)
* `sg3_utils`
* `shadow-utils`
* `shim-aa64` (`shim-signed`; *aarch64*)
* `shim-ia32` (`shim-signed`; *x86_64*)
* `shim-x64` (`shim-signed`; *x86_64*)
* `sil-abyssinica-fonts`
* `sil-mingzat-fonts`
* `sil-nuosu-fonts`
* `sil-padauk-fonts`
* `sil-scheherazade-fonts`
* `slapi-nis`
* `SLOF`
* `smartmontools`
* `smc-meera-fonts` (`smc-fonts`)
* `snapper-devel` (`snapper`)
* `snapper-libs` (`snapper`)
* `snapper`
* `sos`
* `spamassassin`
* `spice-glib-devel` (`spice-gtk`)
* `spice-glib` (`spice-gtk`)
* `spice-gtk-tools` (`spice-gtk`)
* `spice-gtk3-devel` (`spice-gtk`)
* `spice-gtk3-vala` (`spice-gtk`)
* `spice-gtk3` (`spice-gtk`)
* `spice-gtk`
* `spice-protocol`
* `spice-server-devel` (`spice`; *aarch64, armv7hl, i686, x86_64*)
* `spice-server` (`spice`; *aarch64, armv7hl, i686, x86_64*)
* `spice-vdagent`
* `splix`
* `sqlite`
* `squid`
* `srp_daemon` (`rdma-core`; *aarch64, i686, ppc64, ppc64le, s390x, x86_64*)
* `sshpass`
* `sssd-ad` (`sssd`)
* `sssd-client` (`sssd`)
* `sssd-common-pac` (`sssd`)
* `sssd-common` (`sssd`)
* `sssd-dbus` (`sssd`)
* `sssd-ipa` (`sssd`)
* `sssd-kcm` (`sssd`)
* `sssd-krb5-common` (`sssd`)
* `sssd-krb5` (`sssd`)
* `sssd-ldap` (`sssd`)
* `sssd-libwbclient-devel` (`sssd`)
* `sssd-libwbclient` (`sssd`)
* `sssd-nfs-idmap` (`sssd`)
* `sssd-proxy` (`sssd`)
* `sssd-tools` (`sssd`)
* `sssd-winbind-idmap` (`sssd`)
* `sssd`
* `stix-fonts`
* `strace`
* `subscription-manager-plugin-container` (`subscription-manager`)
* `subscription-manager-plugin-ostree` (`subscription-manager`)
* `subscription-manager`
* `subversion-devel` (`subversion`)
* `subversion-gnome` (`subversion`)
* `subversion-javahl` (`subversion`)
* `subversion-kde` (`subversion`)
* `subversion-libs` (`subversion`)
* `subversion-perl` (`subversion`)
* `subversion-python` (`subversion`)
* `subversion-ruby` (`subversion`)
* `subversion-tools` (`subversion`)
* `subversion`
* `sudo-devel` (`sudo`)
* `sudo`
* `supermin-devel` (`supermin`)
* `supermin`
* `sushi`
* `swig-doc` (`swig`)
* `swig`
* `syslinux` (*i686, x86_64*)
* `sysstat`
* `system-config-printer-udev` (`system-config-printer`)
* `system-config-printer`
* `system-storage-manager`
* `tabish-eeyek-fonts`
* `tang`
* `tar`
* `target-restore` (`python-rtslib`)
* `targetcli`
* `targetd`
* `tboot` (*i686, x86_64*)
* `tcl-brlapi` (`brltty`)
* `tcl`
* `tclx`
* `tcpdump`
* `tcsh`
* `teamd` (`libteam`)
* `tex-fonts-hebrew`
* `tftp-server` (`tftp`)
* `tftp`
* `thai-scalable-waree-fonts` (`thai-scalable-fonts`)
* `thunderbird`
* `tibetan-machine-uni-fonts`
* `tigervnc-icons` (`tigervnc`)
* `tigervnc-license` (`tigervnc`)
* `tigervnc-server-applet` (`tigervnc`)
* `tigervnc-server-minimal` (`tigervnc`)
* `tigervnc-server-module` (`tigervnc`; *aarch64, armv7hl, i686, ppc64, ppc64le, x86_64*)
* `tigervnc-server` (`tigervnc`)
* `tigervnc`
* `timedatex`
* `tk`
* `tmpwatch`
* `tmux`
* `tog-pegasus-devel` (`tog-pegasus`)
* `tog-pegasus-libs` (`tog-pegasus`)
* `tog-pegasus-test` (`tog-pegasus`)
* `tog-pegasus`
* `totem-devel` (`totem`)
* `totem-lirc` (`totem`)
* `totem-nautilus` (`totem`)
* `totem`
* `tpm-quote-tools`
* `tpm-tools-devel` (`tpm-tools`)
* `tpm-tools-pkcs11` (`tpm-tools`)
* `tpm-tools`
* `tpm2-tools` (*i686, x86_64*)
* `tpm2-tss-devel` (`tpm2-tss`; *i686, x86_64*)
* `tpm2-tss` (*i686, x86_64*)
* `trace-cmd`
* `traceroute`
* `tree`
* `trousers-devel` (`trousers`)
* `trousers-lib` (`trousers`)
* `trousers-static` (`trousers`)
* `trousers`
* `tss2-devel` (`tss2`; *aarch64, armv7hl, i686, ppc64le, x86_64*)
* `tss2` (*aarch64, armv7hl, i686, ppc64le, x86_64*)
* `tuned-gtk` (`tuned`)
* `tuned-profiles-atomic` (`tuned`)
* `tuned-profiles-compat` (`tuned`)
* `tuned-profiles-cpu-partitioning` (`tuned`)
* `tuned-profiles-nfv-guest` (`tuned`)
* `tuned-profiles-nfv-host` (`tuned`)
* `tuned-profiles-nfv` (`tuned`)
* `tuned-profiles-oracle` (`tuned`)
* `tuned-profiles-realtime` (`tuned`)
* `tuned-profiles-sap-hana` (`tuned`)
* `tuned-profiles-sap` (`tuned`)
* `tuned-utils-systemtap` (`tuned`)
* `tuned-utils` (`tuned`)
* `tuned`
* `uboot-tools`
* `udisks2-iscsi` (`udisks2`)
* `udisks2`
* `unbound-libs` (`unbound`)
* `unbound`
* `units`
* `unixODBC-gui-qt`
* `unixODBC`
* `usb_modeswitch-data`
* `usb_modeswitch`
* `usbguard-dbus` (`usbguard`)
* `usbguard-devel` (`usbguard`)
* `usbguard-tools` (`usbguard`)
* `usbguard`
* `usbutils`
* `util-linux-user` (`util-linux`)
* `util-linux`
* `uuidd` (`util-linux`)
* `varnish-devel` (`varnish`)
* `varnish-docs` (`varnish`)
* `varnish-libs` (`varnish`)
* `varnish-modules`
* `varnish`
* `vconfig`
* `vemana2000-fonts`
* `veritysetup` (`cryptsetup`)
* `vhostmd`
* `vim-enhanced` (`vim`)
* `vim-filesystem` (`vim`)
* `vim-minimal` (`vim`)
* `vim-X11` (`vim`)
* `vinagre`
* `virt-dib` (`libguestfs`)
* `virt-install` (`virt-manager`)
* `virt-manager-common` (`virt-manager`)
* `virt-manager`
* `virt-p2v-maker` (`libguestfs`)
* `virt-top`
* `virt-v2v` (`libguestfs`)
* `virt-viewer`
* `virt-who`
* `vlgothic-fonts`
* `vlgothic-p-fonts` (`vlgothic-fonts`)
* `vm-dump-metrics-devel` (`vhostmd`)
* `vm-dump-metrics` (`vhostmd`)
* `voikko-tools` (`libvoikko`)
* `volume_key`
* `vsftpd`
* `WALinuxAgent`
* `watchdog`
* `wayland-devel` (`wayland`)
* `wayland-protocols-devel` (`wayland-protocols`)
* `webkitgtk4`
* `wget`
* `wireshark-cli` (`wireshark`)
* `wireshark-qt` (`wireshark`)
* `wireshark`
* `wpa_supplicant`
* `wqy-microhei-fonts`
* `wqy-unibit-fonts`
* `wqy-zenhei-fonts`
* `x3270-text` (`x3270`)
* `x3270-x11` (`x3270`)
* `x3270`
* `xdelta`
* `xdg-desktop-portal-devel` (`xdg-desktop-portal`)
* `xdg-desktop-portal-gtk`
* `xdg-desktop-portal`
* `xdg-user-dirs-gtk`
* `xfsdump`
* `xfsprogs`
* `xinetd`
* `xorg-sgml-doctools`
* `xorg-x11-docs`
* `xorg-x11-drivers` (*aarch64, armv7hl, i686, ppc64, ppc64le, x86_64*)
* `xorg-x11-drv-ati` (*aarch64, armv7hl, i686, ppc64, ppc64le, x86_64*)
* `xorg-x11-drv-evdev-devel` (`xorg-x11-drv-evdev`; *aarch64, armv7hl, i686, ppc64, ppc64le, x86_64*)
* `xorg-x11-drv-evdev` (*aarch64, armv7hl, i686, ppc64, ppc64le, x86_64*)
* `xorg-x11-drv-fbdev` (*aarch64, armv7hl, i686, ppc64, ppc64le, x86_64*)
* `xorg-x11-drv-intel-devel` (`xorg-x11-drv-intel`; *i686, x86_64*)
* `xorg-x11-drv-intel` (*i686, x86_64*)
* `xorg-x11-drv-libinput-devel` (`xorg-x11-drv-libinput`; *aarch64, armv7hl, i686, ppc64, ppc64le, x86_64*)
* `xorg-x11-drv-libinput` (*aarch64, armv7hl, i686, ppc64, ppc64le, x86_64*)
* `xorg-x11-drv-nouveau` (*aarch64, armv7hl, i686, ppc64, ppc64le, x86_64*)
* `xorg-x11-drv-qxl` (*aarch64, armv7hl, i686, ppc64, ppc64le, x86_64*)
* `xorg-x11-drv-v4l` (*aarch64, armv7hl, i686, ppc64, ppc64le, x86_64*)
* `xorg-x11-drv-vesa` (*i686, x86_64*)
* `xorg-x11-drv-vmware` (*i686, x86_64*)
* `xorg-x11-fonts-misc` (`xorg-x11-fonts`)
* `xorg-x11-server-utils`
* `xorg-x11-server-Xorg` (`xorg-x11-server`)
* `xorg-x11-server-Xspice` (`xorg-x11-drv-qxl`; *aarch64, armv7hl, i686, x86_64*)
* `xorg-x11-server-Xwayland` (`xorg-x11-server`)
* `xorg-x11-xauth`
* `xrestop`
* `xsane-gimp` (`xsane`)
* `xsane`
* `xterm-resize` (`xterm`)
* `xterm`
* `xvattr`
* `xz`
* `yp-tools`
* `ypbind`
* `ypserv`
* `zd1211-firmware`
* `zip`
* `zsh-html` (`zsh`)
* `zsh`
* `zziplib-devel` (`zziplib`)
* `zziplib-utils` (`zziplib`)
* `zziplib`
