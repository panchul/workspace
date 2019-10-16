
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

Example of the drivers from NVIDIA
https://www.geforce.com/drivers/results/151568

NVIDIA-Linux-x86_64-430.50.run is the latest right now for 20 series.
NVIDIA-Linux-x86_64-390.129.run is the latest for 500 series

Installing on CentOS7:
https://www.cyberciti.biz/faq/how-to-install-nvidia-driver-on-centos-7-linux/


Installing on Fedora 29:
https://linuxconfig.org/how-to-install-the-nvidia-drivers-on-fedora-29-linux
another one, probably NICER:
https://www.if-not-true-then-false.com/2015/fedora-nvidia-guide/

    $ nvidia-installer -v | grep version

    $ dnf update
    $ reboot

    $ dnf install kernel-devel kernel-headers gcc make dkms acpid libglvnd-glx libglvnd-opengl libglvnd-devel pkgconfig

Create or edit /etc/modprobe.d/blacklist.conf
Append ‘blacklist nouveau’

    $ echo "blacklist nouveau" >> /etc/modprobe.d/blacklist.conf

Edit /etc/sysconfig/grub

    Append ‘rd.driver.blacklist=nouveau’ to end of ‘GRUB_CMDLINE_LINUX=”…”‘.

Example row

    GRUB_CMDLINE_LINUX="rd.lvm.lv=fedora/swap rd.lvm.lv=fedora/root rhgb quiet rd.driver.blacklist=nouveau"

Update grub2 conf

for BIOS

    grub2-mkconfig -o /boot/grub2/grub.cfg

for UEFI

    grub2-mkconfig -o /boot/efi/EFI/fedora/grub.cfg

Remove xorg-x11-drv-nouveau

    $ dnf remove xorg-x11-drv-nouveau

If you have following row on /etc/dnf/dnf.conf file, then you can remove it:

    exclude=xorg-x11*

Generate initramfs

    ## Backup old initramfs nouveau image ##
    $ mv /boot/initramfs-$(uname -r).img /boot/initramfs-$(uname -r)-nouveau.img
 
    ## Create new initramfs image ##
    $ dracut /boot/initramfs-$(uname -r).img $(uname -r)

Reboot to runlevel 3
Note: You don’t have Desktop/GUI on runlevel 3. Make sure that you have some access to end of guide. (Print it, use lynx/links/w3m, save it to text file).

    $ systemctl set-default multi-user.target
    $ reboot

// below is continuation, with some overlap:

Confirm that PCI sees it:

    $ lspci -vnn | grep VGA
    01:00.0 VGA compatible controller [0300]: NVIDIA Corporation GP106 [GeForce GTX 1060 6GB] [10de:1c03] (rev a1) (prog-if 00 [VGA controller])

To see cards, it is better to filter out not for `VGA`, but for `[03':

    $ lspci -vnn | grep '\[03'
    [0300] VGA compatible controller
    [0380] Display controller
    [0302] 3D controller

Download driver from nvidia.com

    $ ls NVIDIA-Linux-x86_64-*
    NVIDIA-Linux-x86_64-410.73.run

    $ sudo dnf groupinstall "Development Tools"
    $ sudo dnf install dkms "kernel-devel-uname-r == $(uname -r)"

Disable `nouveau` driver in `/etc/default/grub`:
either by adding `nouveau.modeset=0` to GRUB_CMDLINE_LINUX,
or by adding it to disabled config.

    GRUB_TIMEOUT=5
    GRUB_DISTRIBUTOR="$(sed 's, release .*$,,g' /etc/system-release)"
    GRUB_DEFAULT=saved
    GRUB_DISABLE_SUBMENU=true
    GRUB_TERMINAL_OUTPUT="console"
    GRUB_CMDLINE_LINUX="resume=UUID=df614470-884d-4992-a13c-1665fb0a230e rhgb quiet nouveau.modeset=0"
    GRUB_DISABLE_RECOVERY="true"


Based on your boot method select one of the following:

    BIOS:
    $ sudo grub2-mkconfig -o /boot/grub2/grub.cfg
    EFI:
    $ sudo grub2-mkconfig -o /boot/efi/EFI/fedora/grub.cfg

Switching to text mode:

    $ sudo  systemctl isolate multi-user.target

Install the drivers. When prompted answer YES to installation of NVIDIA's
32-bit compatibility libraries, overwrite existing libglvnd files and
automatic update of your X configuration file: 

    $ sudo bash NVIDIA-Linux-x86_64-*

    $ sudo reboot

To turn back to graphic mode:

    $ sudo systemctl set-default graphical.target
    $ sudo reboot


Just in case there is still a black screen, change the display manager:

    $ sudo dnf install sddm 
    $ sudo systemctl disable gdm
    $ sudo systemctl enable sddm
    $ sudo reboot

---

When running driver .run file:
For error message the error message "ERROR: Temporary directory /tmp is not executable - use the  --tmpdir option to specify a different one." 
add the --tmpdir argument to the command line pointing to a path/directory that is chmod executable.

---

To see cards, it is better to filter out not for `VGA`, but for `[03':

    $ lspci -vnn | grep '\[03'

    [0300] VGA compatible controller
    [0380] Display controller
    [0302] 3D controller

---

Is the nvidia kernel module loaded?

    $ lsmod | grep nvidia

If not, load it with

    $ sudo modprobe nvidia

If it helps then you might want to automatically load it at boot time by appending nvidia (on a new line) to `/etc/modules`

Can also use `lshw` instead:

    $ lshw

---

This might work for some of the drivers:

    $ sudo add-apt-repository ppa:graphics-drivers/ppa
    $ sudo apt-get update
    $ sudo apt-get install nvidia-367

---
