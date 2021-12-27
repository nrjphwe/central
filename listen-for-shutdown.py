#!/usr/bin/env python3

import RPi.GPIO as GPIO
import subprocess

GPIO.setmode(GPIO.BCM)
GPIO.setup(4, GPIO.IN, pull_up_down=GPIO.PUD_UP)

while True:
  GPIO.wait_for_edge(4, GPIO.FALLING)
  subprocess.call(['shutdown', '-h', '2'], shell=False) # 2 second delay
  time.sleep(1)
  GPIO.wait_for_edge(4, GPIO.RISING)
  subprocess.call(['shutdown', '-c'], shell=False)
