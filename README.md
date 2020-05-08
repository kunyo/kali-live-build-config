# kali-live-build-config
This is a fork of kali live-build-config repo. 
Have a look at https://docs.kali.org/development/live-build-a-custom-kali-iso for explanations on how to use the `build.sh` script included in this project.
## Requirements
### For Kali build servers
```
sudo apt update
sudo apt install -y git live-build cdebootstrap devscripts
```
### For debian-like build servers
```
./setup.sh
```
## Usage
```
sudo ./build.sh --variant gnome --verbose
```
