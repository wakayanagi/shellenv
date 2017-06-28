#! /usr/bin/env python
# .zls_color.py script to generate dynamic ZLS_COLORS variable
# for Z-Shell tab completion
# Requires python3
# By Kuen 6/27/2017

# Color codes for different file extensions

# Attribute codes:
# 00=none 01=bold 04=underscore 05=blink 07=reverse 08=concealed

# Text color codes:
# 30=blk 31=red 32=grn 33=yel 34=blu 35=mag 36=cyn 37=wht

# Background color codes:
# 40=blk 41=red 42=grn 43=yel 44=blu 45=mag 46=cyn 47=wht

# Standard file types and objects
defaults_old = [
  'rs=0', 'di=01;34', 'ln=01;36', 'mh=00', 'pi=40;33',
  'so=01;35', 'do=01;35', 'bd=40;33;01', 'cd=40;33;01',
  'or=40;31;01', 'su=37;41', 'sg=30;43', 'ca=30;41',
  'tw=30;42', 'ow=34;42', 'st=37;44', 'ex=01;32']

defaults = [
  'di=36', 'ln=35', 'so=32', 'pi=33', 'ex=31', 'bd=34;46',
  'cd=34;43', 'su=30;41', 'sg=30;46', 'tw=30;42', 'ow=30;43']

# Compressed video file extensions
cvideo = [
  'avi', 'm4v', 'mkv', 'mp4', 'wmv', 'ogm',
  'm2v', 'asf', 'rm', 'rmvb', 'flc', 'fli',
  'flv', 'qt', 'mov']

# MPEG based video file extensions
mvideo = [
  'mpg', 'mpeg', 'ts', 'vob']

# Audio files
audio = [
  'aac', 'mp3', 'mka', 'm4a', 'mpc', 'flac',
  'ogg', 'oga', 'wav', 'mid', 'midi', 'ra']

# Image files
image = [
  'jpg', 'JPG', 'jpeg', 'gif', 'bmp', 'tiff',
  'tif', 'dng', 'DNG', 'png', 'svg', 'svgz',
  'mng', 'pcx']

cvid = ["*." + x + "=01;36" for x in cvideo]
mvid = ["*." + y + "=01;33" for y in mvideo]
aud = ["*." + z + "=01;36" for z in audio]
img = ["*." + w + "=01;32" for w in image]

color_format = defaults + cvid + mvid + aud + img

print(":".join(color_format)+":")
