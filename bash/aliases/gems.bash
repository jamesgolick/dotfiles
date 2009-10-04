#!/bin/bash

function cdgem() {
  cd $GEMDIR/gems/`ls /Library/Ruby/Gems/1.8/gems/ | grep $1-[0-9] | sort -r |head -n1`
}

function editgem() { 
  $EDITOR $GEMDIR/gems/`ls /Library/Ruby/Gems/1.8/gems/ | grep $1-[0-9] | sort -r |head -n1`
}

