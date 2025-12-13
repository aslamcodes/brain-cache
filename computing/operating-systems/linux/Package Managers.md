---
tags:
type:
date: 2025-11-30
done: false
---
> Package managers is probably a scripted install that setups the required libraries

When you distribute a build, its dependencies depend on how it was compiled.  
Static binaries bundle everything inside, so they almost never require external libraries.  
Dynamic binaries rely on shared libraries, so those libraries must already exist on the target system.

Often static executables results in larger build size than dynamic executables. The more libraries you refer, the build size increases for static binaries.

To manage this, packages ship with a **manifest**.  The manifest lists the dependencies your software needs. Each dependency is referenced by its **package name**, not by bundling the library itself.

For this to work, the **package manager’s repository** must already contain those dependency packages. The repository is simply a database + storage location that holds all known packages, their versions, and their own manifests.

If you install a package with `dpkg`, it only unpacks your `.deb` and stops if anything is missing.  
Package managers like `apt` read your manifest, look up each dependency name in the repository, fetch those packages, install them, and only then complete the installation of your package.

This whole flow works because your manifest lists “what you need,” and the repository provides “where to get it.”

The package formats .deb, .rpm - even the underlying software behavior and implementation stays the same - expects a different packaging layers and package handling methods. Example such as the metadata format, the dependency names and repo metadata