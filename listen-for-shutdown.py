#!/usr/bin/env python3

import RPi.GPIO as GPIO
import subprocess, time

GPIO.setmode(GPIO.BCM)
GPIO.setup(4, GPIO.IN, pull_up_down=GPIO.PUD_UP)

while True:
  GPIO.wait_for_edge(4, GPIO.FALLING)
  time.sleep(1)
  if GPIO.input(4) == 0:
    subprocess.call(['shutdown', '-h', 'now'], shell=False) 
