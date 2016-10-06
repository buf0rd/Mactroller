#!/bin/bash
PATH=/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin

count=$(cat /tmp/counter.txt | grep -c ^)
form=/tmp/ssmtp_mailTEMP.txt
myemail=adrianbuford@gmail.com

###################Email and shutdown###############################
if [ $count -gt 10 ]; then

echo "Shutting down"

echo "To: $myemail" > $form
echo "From: $myemail" >> $form
echo "Subject: Server shutdown process initiated" >> $form

cat $form | ssmtp $myemail

rm $form

shutdown

exit 0

else

echo $count "is not enough counts"

echo "To: $myemail" > $form
echo "From: $myemail" >> $form
echo "Subject: Server shutdown ticker @" $count >> $form

cat $form | ssmtp $myemail

rm $form

fi
exit 0
