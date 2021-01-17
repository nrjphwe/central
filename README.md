# central

Apache, PHP and VNC that is used both for regattastart and powercheck

Connect to your Raspberry Pi via SSH Clone this repo: git clone https://github.com/nrjphwe/central 

Then do:
cd central
and then run the setup script by: ./central_install.sh

The shut down uses GPIO4 which is Pin 7 and pin 9 (ground).

The i2c connection uses pin 3 for SDA, and pin 5 for SCL
The shut down uses GPIO4, which is Pin 7.

Pin 2 5V power
Pin 3 i2c SDA
Pin 5 i2c SCL
Pin 6 Ground
Pin 7 GPIO4 used for shutdown
Pin 9 Ground used for shutdown
