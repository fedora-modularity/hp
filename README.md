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
* `parted`, provides the common disk partition manipulation program
* `passwd`, password configuration utility
* `pciutils`, provides PCI bus related utilities
* `policycoreutils`, provides utilities for SELinux-enabled system management;
  tools implemented using non-Platform dynamic languages can be found in the
  appropriate Platform extension module
* `procps-ng`, common utilities
* `psmisc`, common utilities
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

* `adcli`
* `adcli-doc` (`adcli`)
* `adwaita-qt`
* `adwaita-qt4` (`adwaita-qt`)
* `adwaita-qt5` (`adwaita-qt`)
* `adwaita-qt-common` (`adwaita-qt`)
* `aide`
* `apr`
* `apr-devel` (`apr`)
* `apr-util`
* `apr-util-bdb` (`apr-util`)
* `apr-util-devel` (`apr-util`)
* `apr-util-ldap` (`apr-util`)
* `apr-util-mysql` (`apr-util`)
* `apr-util-odbc` (`apr-util`)
* `apr-util-openssl` (`apr-util`)
* `apr-util-pgsql` (`apr-util`)
* `apr-util-sqlite` (`apr-util`)
* `at`
* `audispd-plugins` (`audit`)
* `audit`
* `audit-libs` (`audit`)
* `audit-libs-python3` (`audit`)
* `audit-libs-python` (`audit`)
* `authselect`
* `authselect-libs` (`authselect`)
* `autofs`
* `avahi`
* `avahi-tools` (`avahi`)
* `bind`
* `bind-chroot` (`bind`)
* `bind-dyndb-ldap`
* `bind-pkcs11` (`bind`)
* `bind-pkcs11-utils` (`bind`)
* `bind-sdb` (`bind`)
* `bind-sdb-chroot` (`bind`)
* `bind-utils` (`bind`)
* `blktrace`
* `bluez`
* `booth`
* `booth-arbitrator` (`booth`)
* `booth-core` (`booth`)
* `booth-site` (`booth`)
* `booth-test` (`booth`)
* `cabal-install`
* `ca-certificates`
* `cachefilesd`
* `cassandra`
* `cassandra-server` (`cassandra`)
* `certmonger`
* `checkpolicy`
* `chrony`
* `cifs-utils`
* `cloud-init`
* `clufter-bin` (`clufter`)
* `clufter-cli` (`clufter`)
* `clufter-common` (`clufter`)
* `clufter-lib-ccs` (`clufter`)
* `clufter-lib-general` (`clufter`)
* `clufter-lib-pcs` (`clufter`)
* `compat-openssl10`
* `conntrack-tools`
* `corosync`
* `corosynclib` (`corosync`)
* `corosynclib-devel` (`corosync`)
* `corosync-qdevice` (`corosync`)
* `corosync-qnetd` (`corosync`)
* `cracklib-dicts` (`cracklib`)
* `cronie`
* `cronie-anacron` (`cronie`)
* `cronie-noanacron` (`cronie`)
* `crontabs`
* `ctdb` (`samba`)
* `ctdb-tests` (`samba`)
* `cups`
* `cups-filters`
* `custodia`
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
* `dconf-editor`
* `dhcp-client` (`dhcp`)
* `dhcp-server` (`dhcp`)
* `dnsmasq`
* `dnsmasq-utils` (`dnsmasq`)
* `dovecot`
* `dpdk` (*aarch64, i686, ppc64le, x86_64*)
* `dpdk-devel` (`dpdk`; *aarch64, i686, ppc64le, x86_64*)
* `dpdk-examples` (`dpdk`; *aarch64, i686, ppc64le, x86_64*)
* `dpdk-tools` (`dpdk`; *aarch64, i686, ppc64le, x86_64*)
* `driverctl`
* `e2fsprogs`
* `ebtables`
* `emacs-haskell-mode`
* `erlang-libguestfs` (`libguestfs`)
* `evince`
* `evince-browser-plugin` (`evince`)
* `evince-dvi` (`evince`)
* `evince-nautilus` (`evince`)
* `evolution`
* `evolution-ews`
* `evolution-mapi`
* `fence-agents-all` (`fence-agents`)
* `fence-agents-alom` (`fence-agents`)
* `fence-agents-amt` (`fence-agents`)
* `fence-agents-amt-ws` (`fence-agents`)
* `fence-agents-apc` (`fence-agents`)
* `fence-agents-apc-snmp` (`fence-agents`)
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
* `fence-agents-ilo2` (`fence-agents`)
* `fence-agents-ilo-moonshot` (`fence-agents`)
* `fence-agents-ilo-mp` (`fence-agents`)
* `fence-agents-ilo-ssh` (`fence-agents`)
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
* `fence-agents-vmware` (`fence-agents`)
* `fence-agents-vmware-soap` (`fence-agents`)
* `fence-agents-wti` (`fence-agents`)
* `fence-agents-xenapi` (`fence-agents`)
* `fence-agents-zvm` (`fence-agents`)
* `fence-virt`
* `fence-virtd-cpg` (`fence-virt`)
* `fence-virtd` (`fence-virt`)
* `fence-virtd-libvirt` (`fence-virt`)
* `fence-virtd-multicast` (`fence-virt`)
* `fence-virtd-serial` (`fence-virt`)
* `fence-virtd-tcp` (`fence-virt`)
* `fio`
* `fipscheck`
* `fipscheck-devel` (`fipscheck`)
* `fipscheck-lib` (`fipscheck`)
* `firefox`
* `firewalld`
* `fltk`
* `fltk-devel` (`fltk`)
* `fltk-fluid` (`fltk`)
* `fltk-static` (`fltk`)
* `freeipa-client-common` (`freeipa`)
* `freeipa-client` (`freeipa`)
* `freeipa-common` (`freeipa`)
* `freeipa-python-compat` (`freeipa`)
* `freeipa-server-common` (`freeipa`)
* `freeipa-server-dns` (`freeipa`)
* `freeipa-server` (`freeipa`)
* `freeipa-server-trust-ad` (`freeipa`)
* `freeradius`
* `freerdp`
* `freerdp-devel` (`freerdp`)
* `freerdp-libs` (`freerdp`)
* `ftp`
* `galera`
* `gfs2-utils`
* `ghc`
* `gnome-boxes`
* `gnome-session-wayland-session` (`gnome-session`)
* `gnupg2`
* `gnupg2-smime` (`gnupg2`)
* `gnutls`
* `gnutls-dane` (`gnutls`)
* `gnutls-devel` (`gnutls`)
* `gnutls-utils` (`gnutls`)
* `gssproxy`
* `haproxy`
* `haskell-platform`
* `highcontrast-qt`
* `highcontrast-qt4` (`highcontrast-qt`)
* `highcontrast-qt5` (`highcontrast-qt`)
* `hivex`
* `hivex-devel` (`hivex`)
* `hivex-static` (`hivex`)
* `hlint`
* `httpd`
* `httpd-devel` (`httpd`)
* `httpd-filesystem` (`httpd`)
* `httpd-manual` (`httpd`)
* `httpd-tools` (`httpd`)
* `ibacm` (`rdma-core`; *ppc64, i686, aarch64, x86_64, s390x, ppc64le*)
* `ibus-wayland` (`ibus`)
* `inkscape`
* `iowatcher` (`blktrace`)
* `iproute`
* `iproute-devel` (`iproute`)
* `iproute-doc` (`iproute`)
* `iproute-tc` (`iproute`)
* `iptables`
* `iptables-compat` (`iptables`)
* `iptables-devel` (`iptables`)
* `iptables-libs` (`iptables`)
* `iptables-services` (`iptables`)
* `iptables-utils` (`iptables`)
* `iputils`
* `ipvsadm`
* `iwpmd` (`rdma-core`; *ppc64, i686, aarch64, x86_64, s390x, ppc64le*)
* `jansson`
* `jansson-devel-doc` (`jansson`)
* `jansson-devel` (`jansson`)
* `keepalived`
* `kernel`
* `keyutils`
* `krb5-devel` (`krb5`)
* `krb5-libs` (`krb5`)
* `krb5-pkinit` (`krb5`)
* `krb5-server` (`krb5`)
* `krb5-server-ldap` (`krb5`)
* `krb5-workstation` (`krb5`)
* `ldirectord` (`resource-agents`)
* `lftp`
* `libgcrypt`
* `libgcrypt-devel` (`libgcrypt`)
* `libguestfs`
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
* `libguestfs-javadoc` (`libguestfs`)
* `libguestfs-java` (`libguestfs`)
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
* `libguestfs-zfs` (`libguestfs`; *x86_64, ppc64, i686, ppc64le*)
* `libibcm` (`rdma-core`; *ppc64, i686, aarch64, x86_64, s390x, ppc64le*)
* `libibumad` (`rdma-core`; *ppc64, i686, aarch64, x86_64, s390x, ppc64le*)
* `libibverbs` (`rdma-core`; *ppc64, i686, aarch64, x86_64, s390x, ppc64le*)
* `libibverbs-utils` (`rdma-core`; *ppc64, i686, aarch64, x86_64, s390x, ppc64le*)
* `libipa_hbac-devel` (`sssd`)
* `libipa_hbac` (`sssd`)
* `libkadm5` (`krb5`)
* `libkeepalive`
* `libmbim`
* `libmbim-utils` (`libmbim`)
* `libndp`
* `libndp-devel` (`libndp`)
* `libnetfilter_conntrack`
* `libnetfilter_conntrack-devel` (`libnetfilter_conntrack`)
* `libnetfilter_queue`
* `libnetfilter_queue-devel` (`libnetfilter_queue`)
* `libnfsidmap`
* `libnftnl`
* `libnl3`
* `libnma-devel` (`network-manager-applet`)
* `libnma` (`network-manager-applet`)
* `libnm-gtk-devel` (`network-manager-applet`)
* `libnm-gtk` (`network-manager-applet`)
* `libpwquality`
* `libpwquality-devel` (`libpwquality`)
* `libqb`
* `libqb-devel` (`libqb`)
* `libqmi`
* `libqmi-utils` (`libqmi`)
* `librdmacm` (`rdma-core`; *ppc64, i686, aarch64, x86_64, s390x, ppc64le*)
* `librdmacm-utils` (`rdma-core`; *ppc64, i686, aarch64, x86_64, s390x, ppc64le*)
* `libreoffice`
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
* `libreofficekit` (`libreoffice`)
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
* `libreswan`
* `libseccomp`
* `libselinux-devel` (`libselinux`)
* `libselinux-ruby` (`libselinux`)
* `libselinux-static` (`libselinux`)
* `libselinux-utils` (`libselinux`)
* `libsemanage-devel` (`libsemanage`)
* `libsemanage-static` (`libsemanage`)
* `libsepol-devel` (`libsepol`)
* `libsepol-static` (`libsepol`)
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
* `libtirpc`
* `libvirt`
* `libvirt-admin` (`libvirt`)
* `libvirt-client` (`libvirt`)
* `libvirt-daemon-config-network` (`libvirt`)
* `libvirt-daemon-config-nwfilter` (`libvirt`)
* `libvirt-daemon-driver-interface` (`libvirt`)
* `libvirt-daemon-driver-libxl` (`libvirt`; *x86_64, i686*)
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
* `libvirt-daemon-driver-storage` (`libvirt`)
* `libvirt-daemon-driver-storage-logical` (`libvirt`)
* `libvirt-daemon-driver-storage-mpath` (`libvirt`)
* `libvirt-daemon-driver-storage-rbd` (`libvirt`)
* `libvirt-daemon-driver-storage-scsi` (`libvirt`)
* `libvirt-daemon-driver-storage-sheepdog` (`libvirt`)
* `libvirt-daemon-driver-storage-zfs` (`libvirt`; *ppc64, i686, armv7hl, x86_64, ppc64le*)
* `libvirt-daemon-driver-uml` (`libvirt`)
* `libvirt-daemon-driver-vbox` (`libvirt`; *x86_64, i686*)
* `libvirt-daemon-driver-xen` (`libvirt`; *x86_64, i686*)
* `libvirt-daemon-kvm` (`libvirt`)
* `libvirt-daemon` (`libvirt`)
* `libvirt-daemon-lxc` (`libvirt`)
* `libvirt-daemon-qemu` (`libvirt`)
* `libvirt-daemon-uml` (`libvirt`)
* `libvirt-daemon-vbox` (`libvirt`; *x86_64, i686*)
* `libvirt-daemon-xen` (`libvirt`; *x86_64, i686*)
* `libvirt-devel` (`libvirt`)
* `libvirt-docs` (`libvirt`)
* `libvirt-java`
* `libvirt-java-devel` (`libvirt-java`)
* `libvirt-java-javadoc` (`libvirt-java`)
* `libvirt-libs` (`libvirt`)
* `libvirt-lock-sanlock` (`libvirt`)
* `libvirt-login-shell` (`libvirt`)
* `libvirt-nss` (`libvirt`)
* `libvirt-wireshark` (`libvirt`)
* `libwayland-client` (`wayland`)
* `libwayland-cursor` (`wayland`)
* `libwayland-server` (`wayland`)
* `libwbclient-devel` (`samba`)
* `libwbclient` (`samba`)
* `linuxptp`
* `lksctp-tools`
* `lksctp-tools-devel` (`lksctp-tools`)
* `lldpd`
* `lldpd-devel` (`lldpd`)
* `lua-guestfs` (`libguestfs`)
* `mailman`
* `mariadb`
* `mariadb-connect-engine` (`mariadb`)
* `mariadb-embedded-devel` (`mariadb`)
* `mariadb-embedded` (`mariadb`)
* `mariadb-oqgraph-engine` (`mariadb`)
* `mariadb-server-galera` (`mariadb`)
* `mariadb-server` (`mariadb`)
* `mariadb-server-utils` (`mariadb`)
* `maven`
* `mesa-libwayland-egl` (`mesa`)
* `mgetty`
* `mgetty-sendfax` (`mgetty`)
* `mgetty-viewfax` (`mgetty`)
* `mgetty-voice` (`mgetty`)
* `mobile-broadband-provider-info`
* `mod_auth_gssapi`
* `mod_auth_mellon`
* `mod_authnz_pam`
* `mod_auth_openidc`
* `ModemManager`
* `ModemManager-devel` (`ModemManager`)
* `ModemManager-glib-devel` (`ModemManager`)
* `ModemManager-glib` (`ModemManager`)
* `ModemManager-vala` (`ModemManager`)
* `mod_http2`
* `mod_intercept_form_submit`
* `mod_ldap` (`httpd`)
* `mod_lookup_identity`
* `mod_nss`
* `mod_proxy_html` (`httpd`)
* `mod_security`
* `mod_security_crs`
* `mod_session` (`httpd`)
* `mod_ssl` (`httpd`)
* `mongo-c-driver`
* `mongo-c-driver-devel` (`mongo-c-driver`)
* `mongo-cxx-driver-devel` (`mongo-cxx-driver`)
* `mongodb`
* `mongodb-server` (`mongodb`)
* `netcf`
* `netcf-devel` (`netcf`)
* `netcf-libs` (`netcf`)
* `nettle`
* `nettle-devel` (`nettle`)
* `net-tools`
* `NetworkManager`
* `NetworkManager-adsl` (`NetworkManager`)
* `network-manager-applet`
* `NetworkManager-bluetooth` (`NetworkManager`)
* `NetworkManager-config-server` (`NetworkManager`)
* `NetworkManager-glib-devel` (`NetworkManager`)
* `NetworkManager-glib` (`NetworkManager`)
* `NetworkManager-libnm-devel` (`NetworkManager`)
* `NetworkManager-libnm` (`NetworkManager`)
* `NetworkManager-libreswan`
* `NetworkManager-libreswan-gnome` (`NetworkManager-libreswan`)
* `NetworkManager-ppp` (`NetworkManager`)
* `NetworkManager-team` (`NetworkManager`)
* `NetworkManager-tui` (`NetworkManager`)
* `NetworkManager-wifi` (`NetworkManager`)
* `NetworkManager-wwan` (`NetworkManager`)
* `nfs4-acl-tools`
* `nfsometer`
* `NFStest`
* `nfs-utils`
* `nftables`
* `nginx`
* `nginx-filesystem` (`nginx`)
* `nginx-mod-http-geoip` (`nginx`)
* `nginx-mod-http-image-filter` (`nginx`)
* `nginx-mod-http-perl` (`nginx`)
* `nginx-mod-http-xslt-filter` (`nginx`)
* `nginx-mod-mail` (`nginx`)
* `nginx-mod-stream` (`nginx`)
* `nm-connection-editor` (`network-manager-applet`)
* `node-gyp`
* `nodejs`
* `npm` (`nodejs`)
* `nspr`
* `nspr-devel` (`nspr`)
* `nss`
* `nss-devel` (`nss`)
* `nss-pam-ldapd`
* `nss-tools` (`nss`)
* `ocaml-hivex-devel` (`hivex`)
* `ocaml-hivex` (`hivex`)
* `ocaml-libguestfs-devel` (`libguestfs`)
* `ocaml-libguestfs` (`libguestfs`)
* `ocaml-libvirt`
* `ocaml-libvirt-devel` (`ocaml-libvirt`)
* `openldap`
* `openldap-clients` (`openldap`)
* `openldap-devel` (`openldap`)
* `openldap-servers` (`openldap`)
* `opensc`
* `opensm` (*ppc64, i686, aarch64, x86_64, ppc64le*)
* `openssh-askpass` (`openssh`)
* `openssh-clients` (`openssh`)
* `openssh-keycat` (`openssh`)
* `openssh-server` (`openssh`)
* `openssl`
* `openssl-devel` (`openssl`)
* `openssl-libs` (`openssl`)
* `openssl-perl` (`openssl`)
* `openssl-static` (`openssl`)
* `open-vm-tools-desktop` (`open-vm-tools`; *x86_64, i686*)
* `open-vm-tools-devel` (`open-vm-tools`; *x86_64, i686*)
* `open-vm-tools` (*x86_64, i686*)
* `openvswitch`
* `openvswitch-devel` (`openvswitch`)
* `openvswitch-ovn-central` (`openvswitch`)
* `openvswitch-ovn-common` (`openvswitch`)
* `openvswitch-ovn-docker` (`openvswitch`)
* `openvswitch-ovn-host` (`openvswitch`)
* `openvswitch-ovn-vtep` (`openvswitch`)
* `openvswitch-test` (`openvswitch`)
* `oscap-anaconda-addon`
* `p11-kit`
* `pacemaker`
* `pacemaker-cli` (`pacemaker`)
* `pacemaker-cluster-libs` (`pacemaker`)
* `pacemaker-cts` (`pacemaker`)
* `pacemaker-doc` (`pacemaker`)
* `pacemaker-libs-devel` (`pacemaker`)
* `pacemaker-libs` (`pacemaker`)
* `pacemaker-nagios-plugins-metadata` (`pacemaker`)
* `pacemaker-remote` (`pacemaker`)
* `pam`
* `pam-devel` (`pam`)
* `pam_ssh_agent_auth` (`openssh`)
* `passenger`
* `pcs`
* `pcsc-lite`
* `pcsc-lite-ccid`
* `pcsc-lite-libs` (`pcsc-lite`)
* `perl`
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
* `perl-CPAN`
* `perl-CPAN-Meta`
* `perl-CPAN-Meta-Requirements`
* `perl-CPAN-Meta-YAML`
* `perl-Data-Dumper`
* `perl-DB_File`
* `perl-Devel-Peek` (`perl`)
* `perl-devel` (`perl`)
* `perl-Devel-PPPort`
* `perl-Devel-SelfStubber` (`perl`)
* `perl-Digest`
* `perl-Digest-MD5`
* `perl-Digest-SHA`
* `perl-Encode`
* `perl-Encode-devel` (`perl-Encode`)
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
* `perl-Filter`
* `perl-Filter-Simple`
* `perl-generators`
* `perl-Getopt-Long`
* `perl-hivex` (`hivex`)
* `perl-HTTP-Tiny`
* `perl-interpreter` (`perl`)
* `perl-IO-Compress`
* `perl-IO` (`perl`)
* `perl-IO-Socket-IP`
* `perl-IO-Zlib` (`perl`)
* `perl-IPC-Cmd`
* `perl-IPC-SysV`
* `perl-JSON-PP`
* `perl-libnet`
* `perl-libnetcfg` (`perl`)
* `perl-libs` (`perl`)
* `perl-Locale-Codes`
* `perl-Locale-Maketext`
* `perl-Locale-Maketext-Simple` (`perl`)
* `perl-macros` (`perl`)
* `perl-Math-BigInt`
* `perl-Math-BigInt-FastCalc`
* `perl-Math-BigRat`
* `perl-Math-Complex` (`perl`)
* `perl-Memoize` (`perl`)
* `perl-MIME-Base64`
* `perl-Module-CoreList`
* `perl-Module-CoreList-tools` (`perl-Module-CoreList`)
* `perl-Module-Load`
* `perl-Module-Load-Conditional`
* `perl-Module-Loaded` (`perl`)
* `perl-Module-Metadata`
* `perl-Net-Ping` (`perl`)
* `perl-open` (`perl`)
* `perl-Params-Check`
* `perl-parent`
* `perl-PathTools`
* `perl-perlfaq`
* `perl-PerlIO-via-QuotedPrint`
* `perl-Perl-OSType`
* `perl-Pod-Checker`
* `perl-Pod-Escapes`
* `perl-Pod-Html` (`perl`)
* `perl-podlators`
* `perl-Pod-Parser`
* `perl-Pod-Perldoc`
* `perl-Pod-Simple`
* `perl-Pod-Usage`
* `perl-Scalar-List-Utils`
* `perl-SelfLoader` (`perl`)
* `perl-Socket`
* `perl-Storable`
* `perl-Sys-Guestfs` (`libguestfs`)
* `perl-Sys-Syslog`
* `perl-Term-ANSIColor`
* `perl-Term-Cap`
* `perl-Test-Harness`
* `perl-Test` (`perl`)
* `perl-Test-Simple`
* `perl-tests` (`perl`)
* `perl-Text-Balanced`
* `perl-Text-ParseWords`
* `perl-Text-Tabs+Wrap`
* `perl-Thread-Queue`
* `perl-threads`
* `perl-threads-shared`
* `perl-Time-HiRes`
* `perl-Time-Local`
* `perl-Time-Piece` (`perl`)
* `perl-Unicode-Collate`
* `perl-Unicode-Normalize`
* `perl-utils` (`perl`)
* `perl-version`
* `php`
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
* `policycoreutils`
* `policycoreutils-dbus` (`policycoreutils`)
* `policycoreutils-devel` (`policycoreutils`)
* `policycoreutils-gui` (`policycoreutils`)
* `policycoreutils-newrole` (`policycoreutils`)
* `policycoreutils-python3` (`policycoreutils`)
* `policycoreutils-python-utils` (`policycoreutils`)
* `policycoreutils-restorecond` (`policycoreutils`)
* `policycoreutils-sandbox` (`policycoreutils`)
* `postfix`
* `postfix-perl-scripts` (`postfix`)
* `postgresql`
* `postgresql-contrib` (`postgresql`)
* `postgresql-devel` (`postgresql`)
* `postgresql-server` (`postgresql`)
* `postgresql-upgrade` (`postgresql`)
* `ppp`
* `pptp`
* `pptp-setup` (`pptp`)
* `procmail`
* `python2-clufter` (`clufter`)
* `python2-custodia` (`custodia`)
* `python2-custodia-extra` (`custodia`)
* `python2-hivex` (`hivex`)
* `python2-ipaclient` (`freeipa`)
* `python2-ipalib` (`freeipa`)
* `python2-ipaserver` (`freeipa`)
* `python2-ipatests` (`freeipa`)
* `python2-libguestfs` (`libguestfs`)
* `python2-libipa_hbac` (`sssd`)
* `python2-libsss_nss_idmap` (`sssd`)
* `python2-libvirt` (`libvirt-python`)
* `python2-openvswitch` (`openvswitch`)
* `python2-policycoreutils` (`policycoreutils`)
* `python2-pyOpenSSL` (`pyOpenSSL`)
* `python2-pyroute2` (`python-pyroute2`)
* `python2-samba` (`samba`)
* `python2-samba-test` (`samba`)
* `python2-sssdconfig` (`sssd`)
* `python2-sss-murmur` (`sssd`)
* `python2-sss` (`sssd`)
* `python3`
* `python3-clufter` (`clufter`)
* `python3-custodia` (`custodia`)
* `python3-custodia-extra` (`custodia`)
* `python3-devel` (`python3`)
* `python3-hivex` (`hivex`)
* `python3-ipaclient` (`freeipa`)
* `python3-ipalib` (`freeipa`)
* `python3-ipaserver` (`freeipa`)
* `python3-ipatests` (`freeipa`)
* `python3-libguestfs` (`libguestfs`)
* `python3-libipa_hbac` (`sssd`)
* `python3-libselinux` (`libselinux`)
* `python3-libs` (`python3`)
* `python3-libsss_nss_idmap` (`sssd`)
* `python3-libvirt` (`libvirt-python`)
* `python3-openvswitch` (`openvswitch`)
* `python3-pip` (`python-pip`)
* `python3-pwquality` (`libpwquality`)
* `python3-pyOpenSSL` (`pyOpenSSL`)
* `python3-pyroute2` (`python-pyroute2`)
* `python3-samba` (`samba`)
* `python3-samba-test` (`samba`)
* `python3-setools` (`setools`)
* `python3-setuptools` (`python-setuptools`)
* `python3-sssdconfig` (`sssd`)
* `python3-sss-murmur` (`sssd`)
* `python3-sss` (`sssd`)
* `python3-tkinter` (`python3`)
* `python-pwquality` (`libpwquality`)
* `qemu-guest-agent` (`qemu`)
* `qemu-kvm` (`qemu`)
* `qgnomeplatform`
* `qt`
* `qt5-assistant` (`qt5-qttools`)
* `qt5-designer` (`qt5-qttools`)
* `qt5-doctools` (`qt5-qttools`)
* `qt5-linguist` (`qt5-qttools`)
* `qt5-qdbusviewer` (`qt5-qttools`)
* `qt5-qt3d`
* `qt5-qt3d-devel` (`qt5-qt3d`)
* `qt5-qt3d-doc` (`qt5-doc`)
* `qt5-qt3d-examples` (`qt5-qt3d`)
* `qt5-qtbase`
* `qt5-qtbase-common` (`qt5-qtbase`)
* `qt5-qtbase-devel` (`qt5-qtbase`)
* `qt5-qtbase-doc` (`qt5-doc`)
* `qt5-qtbase-examples` (`qt5-qtbase`)
* `qt5-qtbase-gui` (`qt5-qtbase`)
* `qt5-qtbase-mysql` (`qt5-qtbase`)
* `qt5-qtbase-odbc` (`qt5-qtbase`)
* `qt5-qtbase-postgresql` (`qt5-qtbase`)
* `qt5-qtbase-static` (`qt5-qtbase`)
* `qt5-qtcanvas3d`
* `qt5-qtcanvas3d-doc` (`qt5-doc`)
* `qt5-qtcanvas3d-examples` (`qt5-qtcanvas3d`)
* `qt5-qtconnectivity`
* `qt5-qtconnectivity-devel` (`qt5-qtconnectivity`)
* `qt5-qtconnectivity-doc` (`qt5-doc`)
* `qt5-qtconnectivity-examples` (`qt5-qtconnectivity`)
* `qt5-qtdeclarative`
* `qt5-qtdeclarative-devel` (`qt5-qtdeclarative`)
* `qt5-qtdeclarative-doc` (`qt5-doc`)
* `qt5-qtdeclarative-examples` (`qt5-qtdeclarative`)
* `qt5-qtdeclarative-static` (`qt5-qtdeclarative`)
* `qt5-qtdoc`
* `qt5-qtenginio`
* `qt5-qtenginio-devel` (`qt5-qtenginio`)
* `qt5-qtenginio-examples` (`qt5-qtenginio`)
* `qt5-qtgraphicaleffects`
* `qt5-qtgraphicaleffects-doc` (`qt5-doc`)
* `qt5-qtimageformats`
* `qt5-qtimageformats-doc` (`qt5-doc`)
* `qt5-qtlocation`
* `qt5-qtlocation-devel` (`qt5-qtlocation`)
* `qt5-qtlocation-doc` (`qt5-doc`)
* `qt5-qtlocation-examples` (`qt5-qtlocation`)
* `qt5-qtmultimedia`
* `qt5-qtmultimedia-devel` (`qt5-qtmultimedia`)
* `qt5-qtmultimedia-doc` (`qt5-doc`)
* `qt5-qtmultimedia-examples` (`qt5-qtmultimedia`)
* `qt5-qtquickcontrols`
* `qt5-qtquickcontrols2`
* `qt5-qtquickcontrols2-devel` (`qt5-qtquickcontrols2`)
* `qt5-qtquickcontrols2-doc` (`qt5-doc`)
* `qt5-qtquickcontrols2-examples` (`qt5-qtquickcontrols2`)
* `qt5-qtquickcontrols-doc` (`qt5-doc`)
* `qt5-qtquickcontrols-examples` (`qt5-qtquickcontrols`)
* `qt5-qtscript`
* `qt5-qtscript-devel` (`qt5-qtscript`)
* `qt5-qtscript-doc` (`qt5-doc`)
* `qt5-qtscript-examples` (`qt5-qtscript`)
* `qt5-qtsensors`
* `qt5-qtsensors-devel` (`qt5-qtsensors`)
* `qt5-qtsensors-doc` (`qt5-doc`)
* `qt5-qtsensors-examples` (`qt5-qtsensors`)
* `qt5-qtserialbus`
* `qt5-qtserialbus-devel` (`qt5-qtserialbus`)
* `qt5-qtserialbus-doc` (`qt5-doc`)
* `qt5-qtserialbus-examples` (`qt5-qtserialbus`)
* `qt5-qtserialport`
* `qt5-qtserialport-devel` (`qt5-qtserialport`)
* `qt5-qtserialport-doc` (`qt5-doc`)
* `qt5-qtserialport-examples` (`qt5-qtserialport`)
* `qt5-qtsvg`
* `qt5-qtsvg-devel` (`qt5-qtsvg`)
* `qt5-qtsvg-doc` (`qt5-doc`)
* `qt5-qtsvg-examples` (`qt5-qtsvg`)
* `qt5-qttools`
* `qt5-qttools-common` (`qt5-qttools`)
* `qt5-qttools-devel` (`qt5-qttools`)
* `qt5-qttools-doc` (`qt5-doc`)
* `qt5-qttools-examples` (`qt5-qttools`)
* `qt5-qttools-libs-designercomponents` (`qt5-qttools`)
* `qt5-qttools-libs-designer` (`qt5-qttools`)
* `qt5-qttools-libs-help` (`qt5-qttools`)
* `qt5-qttools-static` (`qt5-qttools`)
* `qt5-qttranslations`
* `qt5-qtwayland`
* `qt5-qtwayland-devel` (`qt5-qtwayland`)
* `qt5-qtwayland-examples` (`qt5-qtwayland`)
* `qt5-qtwebchannel`
* `qt5-qtwebchannel-devel` (`qt5-qtwebchannel`)
* `qt5-qtwebchannel-doc` (`qt5-doc`)
* `qt5-qtwebchannel-examples` (`qt5-qtwebchannel`)
* `qt5-qtwebsockets`
* `qt5-qtwebsockets-devel` (`qt5-qtwebsockets`)
* `qt5-qtwebsockets-doc` (`qt5-doc`)
* `qt5-qtwebsockets-examples` (`qt5-qtwebsockets`)
* `qt5-qtx11extras`
* `qt5-qtx11extras-devel` (`qt5-qtx11extras`)
* `qt5-qtx11extras-doc` (`qt5-doc`)
* `qt5-qtxmlpatterns`
* `qt5-qtxmlpatterns-devel` (`qt5-qtxmlpatterns`)
* `qt5-qtxmlpatterns-doc` (`qt5-doc`)
* `qt5-qtxmlpatterns-examples` (`qt5-qtxmlpatterns`)
* `qt5-rpm-macros` (`qt5`)
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
* `quota`
* `radvd`
* `rdist`
* `rdma-core` (*ppc64, i686, aarch64, x86_64, s390x, ppc64le*)
* `realmd`
* `realmd-devel-docs` (`realmd`)
* `redis`
* `resource-agents`
* `rpcbind`
* `rsh`
* `rsync`
* `rsyslog`
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
* `ruby`
* `ruby-devel` (`ruby`)
* `rubygem-bigdecimal` (`ruby`)
* `rubygem-bundler`
* `rubygem-did_you_mean` (`ruby`)
* `rubygem-io-console` (`ruby`)
* `rubygem-json`
* `rubygem-minitest`
* `rubygem-net-telnet` (`ruby`)
* `rubygem-openssl` (`ruby`)
* `rubygem-power_assert`
* `rubygem-psych` (`ruby`)
* `rubygem-rake`
* `rubygem-rdoc`
* `rubygems-devel` (`ruby`)
* `rubygems` (`ruby`)
* `rubygem-test-unit`
* `rubygem-xmlrpc` (`ruby`)
* `ruby-hivex` (`hivex`)
* `ruby-irb` (`ruby`)
* `ruby-libguestfs` (`libguestfs`)
* `ruby-libs` (`ruby`)
* `samba`
* `samba-client-libs` (`samba`)
* `samba-client` (`samba`)
* `samba-common-libs` (`samba`)
* `samba-common` (`samba`)
* `samba-common-tools` (`samba`)
* `samba-dc-libs` (`samba`)
* `samba-dc` (`samba`)
* `samba-devel` (`samba`)
* `samba-krb5-printing` (`samba`)
* `samba-libs` (`samba`)
* `samba-pidl` (`samba`)
* `samba-test-libs` (`samba`)
* `samba-test` (`samba`)
* `samba-vfs-cephfs` (`samba`; *aarch64, s390x, ppc64le, x86_64*)
* `samba-vfs-glusterfs` (`samba`)
* `samba-winbind-clients` (`samba`)
* `samba-winbind-krb5-locator` (`samba`)
* `samba-winbind-modules` (`samba`)
* `samba-winbind` (`samba`)
* `sbd`
* `scap-security-guide`
* `scrub`
* `seabios`
* `seabios-bin` (`seabios`)
* `seavgabios-bin` (`seabios`)
* `selinux-policy-devel` (`selinux-policy`)
* `selinux-policy-minimum` (`selinux-policy`)
* `selinux-policy-mls` (`selinux-policy`)
* `selinux-policy-sandbox` (`selinux-policy`)
* `selinux-policy-targeted` (`selinux-policy`)
* `sendmail`
* `sendmail-cf` (`sendmail`)
* `sendmail-doc` (`sendmail`)
* `sendmail-milter-devel` (`sendmail`)
* `sendmail-milter` (`sendmail`)
* `setools-console-analyses` (`setools`)
* `setools-console` (`setools`)
* `setools-gui` (`setools`)
* `shadow-utils`
* `slapi-nis`
* `SLOF`
* `spamassassin`
* `spice-server` (`spice`; *aarch64, i686, armv7hl, x86_64*)
* `srp_daemon` (`rdma-core`; *ppc64, i686, aarch64, x86_64, s390x, ppc64le*)
* `sssd`
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
* `sudo`
* `sudo-devel` (`sudo`)
* `supermin`
* `supermin-devel` (`supermin`)
* `teamd` (`libteam`)
* `telnet`
* `tigervnc`
* `tigervnc-icons` (`tigervnc`)
* `tigervnc-license` (`tigervnc`)
* `tigervnc-server-applet` (`tigervnc`)
* `tigervnc-server-minimal` (`tigervnc`)
* `tigervnc-server-module` (`tigervnc`; *ppc64, i686, aarch64, armv7hl, x86_64, ppc64le*)
* `tigervnc-server` (`tigervnc`)
* `timedatex`
* `tuned`
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
* `unbound`
* `unbound-libs` (`unbound`)
* `usbguard`
* `usbguard-dbus` (`usbguard`)
* `usbguard-devel` (`usbguard`)
* `usbguard-tools` (`usbguard`)
* `usb_modeswitch`
* `usb_modeswitch-data`
* `varnish`
* `varnish-devel` (`varnish`)
* `varnish-docs` (`varnish`)
* `varnish-libs` (`varnish`)
* `varnish-modules`
* `vinagre`
* `virt-dib` (`libguestfs`)
* `virt-install` (`virt-manager`)
* `virt-manager`
* `virt-manager-common` (`virt-manager`)
* `virt-p2v-maker` (`libguestfs`)
* `virt-top`
* `virt-v2v` (`libguestfs`)
* `virt-who`
* `vsftpd`
* `wayland-devel` (`wayland`)
* `wayland-protocols-devel` (`wayland-protocols`)
* `webkitgtk4`
* `wget`
* `wpa_supplicant`
* `wvdial`
* `xfsprogs`
* `xorg-x11-server-Xwayland` (`xorg-x11-server`)
