#!/bin/bash
PATH=/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin

mailformADMIN=/tmp/1form.txt
myemail=[insert-email-address-here-without-bracketry]
count=$(cat /tmp/counter.txt | grep -c ^)
adminmac=cc:79:4a:41:6d:04

arp-scan --localnet > /tmp/arpscan.txt

if cat /tmp/arpscan.txt | grep -q $adminmac; then

echo Admin interface located on network. No action required. Counter zer0ed.

rm /tmp/counter.txt

exit 0

else

echo Count Added >> /tmp/counter.txt

./shutdown_counter.sh

fi 
exit 0
