# Host & Platform
Host and Platform is a set of modules or module stacks defining
the base operating system, effectively replacing Fedora 26
Boltron Base Runtime module & concept.

The new modules target modular Fedora releases, starting with
version 27.

This main purpose of this repository is being the content tracker
for the new base modules.

## Content definition

This section includes a list of modules along with toplevel input
packages for package-level dependency resolution.

### `platform`
Platform defines the base of a Fedora release and a large portion
of its userspace API.  Together with `host` it includes all
the components for baremateal or virtual host installations.
Platform content should be sufficient for container base images.

''List of components will be added later.''

### `host`
Host depends on Platform and is bound to it.  The module contains
mainly hardware enablement components and bits tightly linked
to these.  Given its dependency on Platform, deploying the
Host module creates a complete baremetal or virtualized host
operating system.

''List of components will be added later.''

### `shim`
The `shim` module includes unsigned `shim` binaries and is
not part of `host` since signing is largely a manual process
and couldn't be part of the modularity automated pipeline.
Signed `shim` binaries are part of the host which builds against
this module.

''List of components will be added later.''

### `bootstrap`
This module provides a stable selfhosting buildroot for all of
the abovementioned modules as well as for itself.  Whileits
content is mostly defined as build time dependencies of the
above, it might be used for other special purposes such as
generating the installation media.  For this reason, it might
have a toplevel input package list of its own.

''List of components will be added later.''
