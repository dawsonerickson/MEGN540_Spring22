# Get System Updates and Upgrades
sudo apt-get update
sudo apt-get upgrade

# INSTALL PROGRAMMING APPS & LIBS: GIT (version control), MELD (file differences), code (Visual Studio Code), AND AVRDUDE (avr programming)
sudo apt-get install -y build-essential git meld gcc-avr avr-libc avrdude code cmake


# INSTALL SCREEN CAPTURE APPS: - This allows you to record the desktop with audio for assignents
sudo apt-get install -y ffmpeg vokoscreen

# CLONE CLASS REPOS AND SETUP FILE SYSTEM
cd ~/Desktop
git clone https://github.com/M3R-CSM/MEGN540.git
cd MEGN540
git submodule update --init --recursive
mkdir BIN
bash SerialMonitor/install_dep.sh
cd ..

# Remove Mode Manager Which Causes Issues with programming
sudo apt-get purge modemmanager
sudo apt-get autoremove

# SETUP UDEV RULES FOR ZUMO
sudo sh -c 'echo "ACTION==\"add\", SUBSYSTEM==\"tty\", ATTRS{idVendor}==\"1ffb\", ATTRS{idProduct}==\"2300\", SYMLINK+=\"ttyZumoCar\"
ACTION==\"add\", SUBSYSTEM==\"tty\", ATTRS{idVendor}==\"1ffb\", ATTRS{idProduct}==\"0101\", SYMLINK+=\"ttyZumoCarAVR\"
SUBSYSTEM==\"usb\", ATTRS{idVendor}==\"1ffb\", GROUP=\"dialout\", MODE=\"0666\" " > /etc/udev/rules.d/99-zumo.rules'

sudo udevadm trigger