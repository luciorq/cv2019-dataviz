#!/bin/bash
# my_add_user.sh

if [ "$#" -lt 1 ]
         then
                        echo "$0 username passwd"
                               exit
                       fi

                       user=$1
                       passwd=cursodeverao2019

                       sudo useradd $user -d /home/$user  -m  ;
                       echo $passwd | sudo passwd $user ;
