see /etc/apt/sources, they list where to source a package for each type of packages such deb..

![[package-1758810534280.png]]

![[package-1758810553156.png]]

But these packages have to be installed individually via tools like `dpkg`. If you install a package that has 10 dependencies, they you would need to install those 10 dependencies yourself

That's why there's systems like package managers such as `apt` an `yum`. They make it very simple to install/remove/update package and its dependencies
