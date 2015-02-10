# vagrant-nfsen
###### a vagrant box that provisions [nfsen](http://sourceforge.net/projects/nfsen) and [nfdump](http://sourceforge.net/projects/nfdump/)

Use
---

* The virtual machine does the routing NetFlow packets received on localhost: 9995 to the profile called `network`.
* All local traffic with the virtual machine is collected with [fprobe](http://sourceforge.net/projects/fprobe/), and indexed to the profile called `local`.
* The nfsen the web interface can be accessed at `http://localhost:8080/nfsen/`


Thanks
------

Thanks to [Justin](https://github.com/JustinAzoff) for the first version of these scripts.
