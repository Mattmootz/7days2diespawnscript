#!/bin/bash

serverup=$(ps -ef | grep ./7DaysToDieServer.x86_64| grep -v grep ) 

if [[ $serverup == "" ]]
	then
	echo server is down exiting
	exit
fi  

roll=$(( RANDOM % 5 ))
echo "roll was $roll"
if [[ $roll -eq "0" ]] 

then

/usr/bin/expect -f /user/icarus/message.txt

function zombieStrippers() { 
#find all the players and spawns zombiestrippers by them
get player info
/usr/bin/expect -f getplayers.txt >/tmp/out.txt

count=$(grep "id=" -c /tmp/out.txt)

if [[ $count -le 0 ]]
then
exit
fi

for ((i=1; i<=count; i++));
do

x=$(grep -m$i "id=" /tmp/out.txt |tail -n1  | cut -d "," -f3 | cut -d "(" -f2)
y=$(grep -m$i "id=" /tmp/out.txt |tail -n1  | cut -d "," -f4)
z=$(grep -m$i "id=" /tmp/out.txt |tail -n1  | cut -d "," -f5| cut -d ")" -f1 )
 

spawnx=$(echo $x + 10 | bc)
spawny=$(echo $y + 10 | bc) 
spawnz=$(echo $z + 2 | bc)

 
echo "spawn telnet localhost 8081" >/tmp/consolecmds.txt
echo "expect" >>/tmp/consolecmds.txt
echo "send \"sea zombieStripper $spawnx $spawny $spawnz 2 \r\"" >>/tmp/consolecmds.txt
echo "expect" >>/tmp/consolecmds.txt
echo 'send "exit \r"' >>/tmp/consolecmds.txt

/usr/bin/expect -f /tmp/consolecmds.txt

done 
exit
}

function horde() {

echo "spawn telnet localhost 8081" >/tmp/consolecmds.txt
echo "expect" >>/tmp/consolecmds.txt
echo "send \"spawnwanderinghorde \r\"" >>/tmp/consolecmds.txt
echo "expect" >>/tmp/consolecmds.txt
echo 'send "exit \r"' >>/tmp/consolecmds.txt

/usr/bin/expect -f /tmp/consolecmds.txt
exit
}

function supplydrop() {

echo "spawn telnet localhost 8081" >/tmp/consolecmds.txt
echo "expect" >>/tmp/consolecmds.txt
echo "send \"spawnairdrop \r\"" >>/tmp/consolecmds.txt
echo "expect" >>/tmp/consolecmds.txt
echo 'send "exit \r"' >>/tmp/consolecmds.txt


/usr/bin/expect -f /tmp/consolecmds.txt
exit
}

function instant_night() {

echo "spawn telnet localhost 8081" >/tmp/consolecmds.txt
echo "expect" >>/tmp/consolecmds.txt
echo "send \"settime night \r\"" >>/tmp/consolecmds.txt
echo "expect" >>/tmp/consolecmds.txt
echo 'send "exit \r"' >>/tmp/consolecmds.txt


/usr/bin/expect -f /tmp/consolecmds.txt
exit
}


function instant_day() {

echo "spawn telnet localhost 8081" >/tmp/consolecmds.txt
echo "expect" >>/tmp/consolecmds.txt
echo "send \"settime day \r\"" >>/tmp/consolecmds.txt
echo "expect" >>/tmp/consolecmds.txt
echo 'send "exit \r"' >>/tmp/consolecmds.txt


/usr/bin/expect -f /tmp/consolecmds.txt
exit
}

function zombiefathawian() { 
#find all the players and spawns zombiesfathawian by them
#get player info
/usr/bin/expect -f getplayers.txt >/tmp/out.txt

count=$(grep "id=" -c /tmp/out.txt )

if [[ $count -le 0 ]]
then
exit
fi

for ((i=1; i<=count; i++));
do

x=$(grep -m$i "id=" /tmp/out.txt |tail -n1  | cut -d "," -f3 | cut -d "(" -f2)
y=$(grep -m$i "id=" /tmp/out.txt |tail -n1  | cut -d "," -f4)
z=$(grep -m$i "id=" /tmp/out.txt |tail -n1  | cut -d "," -f5| cut -d ")" -f1 )
 

spawnx=$(echo $x + 10 | bc)
spawny=$(echo $y + 10 | bc) 
spawnz=$(echo $z + 2 | bc)

 
echo "spawn telnet localhost 8081" >/tmp/consolecmds.txt
echo "expect" >>/tmp/consolecmds.txt
echo "send \"sea zombieFatHawaiian $spawnx $spawny $spawnz 4 \r\"" >>/tmp/consolecmds.txt
echo "expect" >>/tmp/consolecmds.txt
echo 'send "exit \r"' >>/tmp/consolecmds.txt

/usr/bin/expect -f /tmp/consolecmds.txt

done 
exit
}

function air_drop() {

echo "spawn telnet localhost 8081" >/tmp/consolecmds.txt
echo "expect" >>/tmp/consolecmds.txt
echo "send \"spawnairdrop \r\"" >>/tmp/consolecmds.txt
echo "expect" >>/tmp/consolecmds.txt
echo 'send "exit \r"' >>/tmp/consolecmds.txt


/usr/bin/expect -f /tmp/consolecmds.txt


}

pick=$(( RANDOM % 6 ))

	case "$pick" in
		0)
		  air_drop;;
		1)
		 zombiefathawian;;
		2)
		 instant_day;;
		3)
		 instant_night;; 		
		4)
		 supplydrop;;
		5)
		 horde;;	
	 	6)
		 zombieStrippers;;
esac
fi
