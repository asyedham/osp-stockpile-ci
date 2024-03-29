#/bin/bash

CHANGED=$(git diff remotes/origin/master roles/openstack_* roles/cpu* roles/kernel-debug/ roles/dmidecode/ roles/yum_*)

if [ -n "$CHANGED" ]; then
   echo "setting up infrared setup"
   cd /root
   sh ./stockpile-ci.sh <hostname> full
else
   figlet no_openstack_changes
   git diff remotes/origin/master --name-only ;
   git log | head -n 20 ;
   bash ci_test.sh /root/.kube/config

fi

