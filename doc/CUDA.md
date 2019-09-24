
## UNDER CONSTRUCTION

# CUDA

See also:

- [OpenGL](OpenGL.md)
- [OpenCV](OpenCV.md)
- [DirectX](DirectX.md)

---

Quick how-to and getting-started
https://devblogs.nvidia.com/even-easier-introduction-cuda/

---

My own sandbox with some snippets:
https://github.com/panchul/sb_cpp/tree/master/cuda

---

Installing on Fedora 29
https://linuxconfig.org/how-to-install-nvidia-cuda-toolkit-on-fedora-29-linux

    $ wget https://developer.download.nvidia.com/compute/cuda/repos/fedora27/x86_64/cuda-repo-fedora27-10.0.130-1.x86_64.rpm
    $ sudo rpm -i cuda-repo-*.rpm
    $ dnf install cuda

Add these to ~/.bashrc    
    
    export PATH=/usr/local/cuda/bin:$PATH
    export LD_LIBRARY_PATH=/usr/local/cuda/lib64:$LD_LIBRARY_PATH

See `nvcc` is there and the device is visiable:

    $ nvcc --version
    $ nvidia-smi

See the samples work:

    $ mkdir cuda-samples
    $ cuda-install-samples-10.0.sh cuda-samples/
    $ cd cuda-samples/NVIDIA_CUDA-10.0_Samples/0_Simple/clock
    $ make

The gcc version issue goes away if you get gcc 7 - the latest cuda supports.

    $ sudo dnf --releasever=27 install gcc-7.3.1-6.fc27

Or, actually, get and install whatever the number the driver wants:

    $ wget http://download-ib01.fedoraproject.org/pub/fedora/linux/updates/29/Everything/x86_64/Packages/g/gcc-8.3.1-2.fc29.x86_64.rpm
 
(from https://fedora.pkgs.org/29/fedora-updates-x86_64/gcc-8.3.1-2.fc29.x86_64.rpm.html)

    $ yum localinstall gcc-8.3.1-2.fc29.x86_64.rpm 

There seem to be a GeForce drivers here:
http://us.download.nvidia.com/XFree86/Linux-x86_64/390.87/NVIDIA-Linux-x86_64-390.87.run

which might need to have the kernel source location specified:

    $ ./NVIDIA-Linux-x86_64-390.87.run --kernel-source-path /usr/src/kernels/5.2.11-10.fc29.x86_64

---
