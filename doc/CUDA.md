[Home](Readme.md)
# CUDA

See also:

 - [AMP](AMP.md)
 - [ComputerVision](ComputerVision.md)
 - [DirectX](DirectX.md)
 - [OpenACC](OpenACC.md)
 - [GPU](GPU.md)
 - [OpenCV](OpenCV.md)
 - [OpenGL](OpenGL.md)
 - [Nvidia Triton Inferencing Server](Triton_inference_server.md)
 - [Ubuntu](Ubuntu.md)
 - [Unity](Unity.md)

**Table of contents**

 - [Hardware](CUDA.md#Hardware)
 - [Installation](CUDA.md#Installation)
   - [Installing with Kubernetes](CUDA.md#Installing-with-Kubernetes)
   - [Installing on Ubuntu](CUDA.md#Installing-on-Ubuntu)
   - [Installing on CentOS7](CUDA.md#Installing-on-CentOS7)
   - [Installing on Fedora 29](CUDA.md#Installing-on-Fedora-29)
 - [C/C++ programming](CUDA.md#C/C++-programming)
 - [Miscellaneous](CUDA.md#Miscellaneous)

## Hardware  

---

Nice article about considerations when buying a GPU board.
https://timdettmers.com/2019/04/03/which-gpu-for-deep-learning/

---

Tesla V100 Server: On-Prem vs AWS Cost Comparison
https://lambdalabs.com/blog/8-v100-server-on-prem-vs-p3-instance-tco-analysis-cost-comparison/

RTX 2080 Ti Deep Learning Benchmarks with TensorFlow - 2019
https://lambdalabs.com/blog/2080-ti-deep-learning-benchmarks/

---

## Installation 

### Installing-with-Kubernetes

---

NVIDIA gpu how-to:
https://docs.nvidia.com/datacenter/kubernetes/kubernetes-upstream/index.html

---

### Installing on Ubuntu

---

I think I used something like this for V100s:
https://docs.microsoft.com/en-us/azure/virtual-machines/linux/n-series-driver-setup

```bash
    $lspci | grep -i NVIDIA
```

Should see it.    
    
```bash
    $ CUDA_REPO_PKG=cuda-repo-ubuntu1604_10.0.130-1_amd64.deb
    $ wget -O /tmp/${CUDA_REPO_PKG} http://developer.download.nvidia.com/compute/cuda/repos/ubuntu1604/x86_64/${CUDA_REPO_PKG} 
    $ sudo dpkg -i /tmp/${CUDA_REPO_PKG}
    $ sudo apt-key adv --fetch-keys https://developer.download.nvidia.com/compute/cuda/repos/ubuntu1604/x86_64/7fa2af80.pub 
    $ rm -f /tmp/${CUDA_REPO_PKG}
    $ sudo apt-get update
    $ sudo apt-get install cuda-drivers
    $ sudo apt-get install cuda
```

And the updates(!!! might have had to do, I think it did not work without it)

```bash
    $ sudo apt-get update
    $ sudo apt-get upgrade -y
    $ sudo apt-get dist-upgrade -y
    $ sudo apt-get install cuda-drivers
    $ sudo reboot
```

---

Had some issues with Python projects, linked the run-time environment from 10.2 to 10.1 that it wanted.

```bash
    $ sudo ln -s /usr/local/cuda-10.2/targets/x86_64-linux/lib/libcudart.so.10.2 /usr/lib/x86_64-linux-gnu/libcudart.so.10.1
```

And added the lib folders to the `LD_LIBRARY_PATH` in `~/.bashrc`:

```bash
    ...
    export LD_LIBRARY_PATH=/home/username/OpenCV/opencv/build/lib:/home/username/anaconda3/lib/:$LD_LIBRARY_PATH
    ...
```

!!! The configuration is rather finiki - aome other things broke, the nvcc crashed with segmentation fault.

---

CUDA compatibility matrix, etc.  
https://docs.nvidia.com/deploy/cuda-compatibility/index.html

For the Compute Capability, see here:  
https://developer.nvidia.com/cuda-gpus

github.com/fireice-uk/xmr-stak-nvidia/issue/159  
arnon.dk/matching-sm-architectures-arch-and-gencode-for-various-nvidia-cards/

cuda 10.1 >= 418.36  
cuda 9.1 >= 390.46

Actually, I think 390 is for cuda 8.0, e.g. Fedora 23

---

To see cards, it is better to filter out not for `VGA`, but for `[03':

```bash
    $ lspci -vnn | grep '\[03'

    [0300] VGA compatible controller
    [0380] Display controller
    [0302] 3D controller
```

---

Is the nvidia kernel module loaded?

```bash
    $ lsmod | grep nvidia
```

If not, load it with

```bash
    $ sudo modprobe nvidia
```

If it helps then you might want to automatically load it at boot time by appending nvidia (on a new line) to `/etc/modules`

Can also use `lshw` instead:

```bash
    $ lshw
```
---

Might be specific to their own package, but still interesting link:
https://lambdalabs.com/blog/install-cuda-10-on-ubuntu-18-04/

---

## Installing on CentOS7

https://www.cyberciti.biz/faq/how-to-install-nvidia-driver-on-centos-7-linux/

## Installing on Fedora 29

https://linuxconfig.org/how-to-install-the-nvidia-drivers-on-fedora-29-linux
another one, probably NICER:
https://www.if-not-true-then-false.com/2015/fedora-nvidia-guide/

```bash
    $ nvidia-installer -v | grep version

    $ dnf update
    $ reboot
```

To see the existing pci cards:

```bash
    $ lspci | grep -i --color 'vga\|3d\|2d'
```

To see the current drivers, one can use:
(might have to install package `lshw`)

```bash
    $ sudo lshw -class display


    $ dnf install kernel-devel kernel-headers gcc make dkms acpid libglvnd-glx libglvnd-opengl libglvnd-devel pkgconfig
```

Create or edit /etc/modprobe.d/blacklist.conf
Append ‘blacklist nouveau’

```bash
    $ echo "blacklist nouveau" >> /etcte/modprobe.d/blacklist.conf
```

Edit /etc/sysconfig/grub

    Append ‘rd.driver.blacklist=nouveau’ to end of ‘GRUB_CMDLINE_LINUX=”…”‘.

Example row

    GRUB_CMDLINE_LINUX="rd.lvm.lv=fedora/swap rd.lvm.lv=fedora/root rhgb quiet rd.driver.blacklist=nouveau"

Update grub2 conf

for BIOS

```bash
    grub2-mkconfig -o /boot/grub2/grub.cfg
```

for UEFI

```bash
    grub2-mkconfig -o /boot/efi/EFI/fedora/grub.cfg
```

Remove xorg-x11-drv-nouveau

```bash
    $ dnf remove xorg-x11-drv-nouveau
```
If you have following row on /etc/dnf/dnf.conf file, then you can remove it:

```bash
    exclude=xorg-x11*
```

Generate initramfs

```bash
    ## Backup old initramfs nouveau image ##
    $ mv /boot/initramfs-$(uname -r).img /boot/initramfs-$(uname -r)-nouveau.img
 
    ## Create new initramfs image ##
    $ dracut /boot/initramfs-$(uname -r).img $(uname -r)
```

Reboot to runlevel 3
Note: You don’t have Desktop/GUI on runlevel 3. Make sure that you have some access to end of guide. (Print it, use lynx/links/w3m, save it to text file).

```bash
    $ systemctl set-default multi-user.target
    $ reboot
```

// below is continuation, with some overlap:

Confirm that PCI sees it:

```bash
    $ lspci -vnn | grep VGA
    01:00.0 VGA compatible controller [0300]: NVIDIA Corporation GP106 [GeForce GTX 1060 6GB] [10de:1c03] (rev a1) (prog-if 00 [VGA controller])
```

To see cards, it is better to filter out not for `VGA`, but for `[03':

```bash
    $ lspci -vnn | grep '\[03'
    [0300] VGA compatible controller
    [0380] Display controller
    [0302] 3D controller
```

Download driver from nvidia.com

```bash
    $ ls NVIDIA-Linux-x86_64-*
    NVIDIA-Linux-x86_64-410.73.run

    $ sudo dnf groupinstall "Development Tools"
    $ sudo dnf install dkms "kernel-devel-uname-r == $(uname -r)"
```

Disable `nouveau` driver in `/etc/default/grub`:
either by adding `nouveau.modeset=0` to GRUB_CMDLINE_LINUX,
or by adding it to disabled config.

```bash
    GRUB_TIMEOUT=5
    GRUB_DISTRIBUTOR="$(sed 's, release .*$,,g' /etc/system-release)"
    GRUB_DEFAULT=saved
    GRUB_DISABLE_SUBMENU=true
    GRUB_TERMINAL_OUTPUT="console"
    GRUB_CMDLINE_LINUX="resume=UUID=df614470-884d-4992-a13c-1665fb0a230e rhgb quiet nouveau.modeset=0"
    GRUB_DISABLE_RECOVERY="true"
```

Based on your boot method select one of the following:

BIOS:
```bash
    $ sudo grub2-mkconfig -o /boot/grub2/grub.cfg
```

EFI:
```bash
    $ sudo grub2-mkconfig -o /boot/efi/EFI/fedora/grub.cfg
```
Switching to text mode:

```bash
    $ sudo  systemctl isolate multi-user.target
```

For Fedora 25 this is what I needed to do:

```bash
    $ sudo yum remove xorg-x11-drv-nvidia\* kmod-nvidia\*
```

Install the drivers. When prompted answer YES to installation of NVIDIA's
32-bit compatibility libraries, overwrite existing libglvnd files and
automatic update of your X configuration file: 

```bash
    $ sudo bash NVIDIA-Linux-x86_64-*

    $ sudo reboot
```

To turn back to graphic mode:

```bash
    $ sudo systemctl set-default graphical.target
    $ sudo reboot
```

Just in case there is still a black screen, change the display manager:

```bash
    $ sudo dnf install sddm 
    $ sudo systemctl disable gdm
    $ sudo systemctl enable sddm
    $ sudo reboot
```

### Multiple versions

---

An article about installing both CUDA 10 and 9 on the same machine (Ubuntu 18.04)
https://medium.com/thecyphy/multi-version-cuda-and-tensorflow-gpu-on-ubuntu-18-04-lts-22cfcd32f06a

---

## C/C++ programming

---

My own sandbox with some snippets:
https://github.com/panchul/sb_cpp/tree/master/cuda

---

The CUDA C reference
https://docs.nvidia.com/cuda/cuda-c-programming-guide/index.html

---

## Miscellaneous

---

Another useful link for troubleshooting of Docker issues with GPUs:
https://medium.com/@aaronpolhamus/nvidia-powered-ml-station-with-fedora-29-docker-a8e4bd6a80ae

---

Funny demo of GPU vs. CPU
https://www.youtube.com/watch?v=-P28LKWTzrI

---

Nice intro .pdf from NVidia  
https://www.nvidia.com/docs/IO/116711/sc11-cuda-c-basics.pdf

Another, basics:
https://www.youtube.com/watch?v=nvrEDBcbaDM

Learn CUDA in an Afternoon: an Online Hands-on Tutorial
https://www.youtube.com/watch?v=_41LCMFpsFs

Slides from that talk:
http://www.epcc.ed.ac.uk/online-training/learnCUDA

---

Quick how-to and getting-started
https://devblogs.nvidia.com/even-easier-introduction-cuda/

---

Installing on Fedora 29 (presuming will work the same on 30)
https://linuxconfig.org/how-to-install-nvidia-cuda-toolkit-on-fedora-29-linux

```bash
    $ wget https://developer.download.nvidia.com/compute/cuda/repos/fedora27/x86_64/cuda-repo-fedora27-10.0.130-1.x86_64.rpm
```

Or, for CentOS 7

```bash
    $ wget https://developer.download.nvidia.com/compute/cuda/repos/rhel7/x86_64/cuda-repo-rhel7-10.0.130-1.x86_64.rpm
    
    $ sudo rpm -i cuda-repo-*.rpm

    $ sudo dnf update
    
    $ dnf install cuda
```

Add these to ~/.bashrc    
    
```bash
    export PATH=/usr/local/cuda/bin:$PATH
    export LD_LIBRARY_PATH=/usr/local/cuda/lib64:$LD_LIBRARY_PATH
```

See `nvcc` is there and the device is visiable:

```bash
    $ nvcc --version
    $ nvidia-smi
```

See the samples work:

```bash
    $ mkdir cuda-samples
    $ cuda-install-samples-10.0.sh cuda-samples/
    $ cd cuda-samples/NVIDIA_CUDA-10.0_Samples/0_Simple/clock
    $ make
```

The gcc version issue goes away if you get gcc 7 - the latest cuda supports.

```bash
    $ sudo dnf --releasever=27 install gcc-7.3.1-6.fc27
```

Or, actually, get and install whatever the number the driver wants:

```bash
    $ wget http://download-ib01.fedoraproject.org/pub/fedora/linux/updates/29/Everything/x86_64/Packages/g/gcc-8.3.1-2.fc29.x86_64.rpm
```

(from https://fedora.pkgs.org/29/fedora-updates-x86_64/gcc-8.3.1-2.fc29.x86_64.rpm.html)

```bash
    $ yum localinstall gcc-8.3.1-2.fc29.x86_64.rpm 
```

There seem to be a GeForce drivers here:
http://us.download.nvidia.com/XFree86/Linux-x86_64/390.87/NVIDIA-Linux-x86_64-390.87.run

which might need to have the kernel source location specified:

```bash
    $ ./NVIDIA-Linux-x86_64-390.87.run --kernel-source-path /usr/src/kernels/5.2.11-10.fc29.x86_64
```

---

Example of the drivers from NVIDIA
https://www.geforce.com/drivers/results/151568

- `NVIDIA-Linux-x86_64-430.50.run` is the latest right now for 20 series.
- `NVIDIA-Linux-x86_64-390.129.run` is the latest for 500 series

---

When running driver .run file:
For error message the error message "ERROR: Temporary directory /tmp is not executable - use the  --tmpdir option to specify a different one." 
add the --tmpdir argument to the command line pointing to a path/directory that is chmod executable.

---

This might work for some of the drivers:

```bash
    $ sudo add-apt-repository ppa:graphics-drivers/ppa
    $ sudo apt-get update
    $ sudo apt-get install nvidia-367
```

---

Cut/paste from some thread on Internet about Ubuntu and CUDA:

Is the problem that you can not see what is going on on the desktop while installing? If so you could try with a text based network installer https://www.ubuntu.com/download/alternative-downloads
then install ubuntu-desktop with

```bash
    $ sudo tasksel
```

and for the nvidia driver you need a newer one that what comes with 18.04 so add the graphics-driver ppa

```bash
    $ sudo add-apt-repository ppa:graphics-drivers/ppa
```

and install it with

```bash
    $ sudo ubuntu-drivers install
```

Or if you do not mind not having a LTS version so you have to upgrade every half year and do not mind installing it before the release in a couple of weeks you could go with 19.04 which has the newest 418.56 drivers already. The installer from the live disc there probably does display correctly.

---

Installing NVidia drivers and CUDA on Ubuntu  
https://www.pugetsystems.com/labs/hpc/The-Best-Way-To-Install-Ubuntu-18-04-with-NVIDIA-Drivers-and-any-Desktop-Flavor-1178/  
https://www.pugetsystems.com/labs/hpc/How-to-install-CUDA-9-2-on-Ubuntu-18-04-1184/  

---

For profiling, you need to set the access:

https://developer.nvidia.com/nvidia-development-tools-solutions-ERR_NVGPUCTRPERM-permission-issue-performance-counters#SolnAdminTag

```bash
    $ systemctl set-default multi-user.target
    $ shutdown -r now
```

Unload dependent modules
    
```bash
    $ modprobe -r nvidia_uvm nvidia_drm nvidia_modeset nvidia-vgpu-vfio nvidia 
```

Specify the access you desire: Insert the modules with the registry key set/unset.:
To require administrative privileges (CAP_SYS_ADMIN capability set) to profile using NVIDIA GPU performance counters
      
```bash
    $ modprobe nvidia NVreg_RestrictProfilingToAdminUsers=1
```

Or, to allow any user to profile using NVIDIA GPU performance counters
      
```bash
    $ modprobe nvidia NVreg_RestrictProfilingToAdminUsers=0

    $ systemctl set-default graphical.target
```

---
