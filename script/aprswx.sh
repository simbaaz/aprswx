#!/bin/bash

user=XXXXXX
password=12345
callsign=XXXXXX-10

#Define APRS-IS server

server=russia.aprs2.net
port=14580

#Define station location

lat=5536.22N
lon=03736.22E

#Define data

temp_c=$1

#Convert temperature from Celsius to in Farenheit

temp_f="000"$( echo "($temp_c*1.8+32+0.5)/1" | bc)
temp_f=${temp_f:(-3)}

hum="00"$2
hum=${hum:(-2)}

bar="00000"$3
bar=${bar:(-5)}

comment="Chertanovo WX RPi+RTL_433"

#Build APRS Weather Report packet

data="!${lat}/${lon}_.../...g...t${temp_f}r...p...P...h${hum}b${bar}"

#Check data for valid length

if [ ${#data} -eq 56 ]

#Send data to the server

 printf "%s\n" "user $user pass $password" "${callsign}>APN001,TCPIP*:${data}${comment}"

#| ncat $server $port

fi